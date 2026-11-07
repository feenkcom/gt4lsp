"
Immutable snapshot of an LSP editor menu request. Records source, inclusive Smalltalk selection intervals, zero-based caret boundaries and the client document version. assertSourceCurrent/isSourceCurrent are worker-safe and consult only file-model text and client version. assertCurrent/isCurrent also read live editor text, carets and selection, so they must run on the UI process. Workers use the immutable snapshot; enqueued UI tasks revalidate before publishing results or applying changes.
"
Class {
	#name : #GtLSPEditorContext,
	#superclass : #Object,
	#instVars : [
		'lspFile',
		'editor',
		'source',
		'selectionRanges',
		'cursorPositions',
		'version'
	],
	#category : #'GToolkit4LSP-Editor'
}

{ #category : #'instance creation' }
GtLSPEditorContext class >> file: aFile editor: anEditor [
	^ self new initializeFile: aFile editor: anEditor
]

{ #category : #testing }
GtLSPEditorContext >> assertCurrent [
	self isCurrent
		ifFalse: [ self error: 'Editor context changed; reopen the transformation menu' ]
]

{ #category : #testing }
GtLSPEditorContext >> assertSourceCurrent [
	self isSourceCurrent
		ifFalse: [ self error: 'Editor source changed; reopen the transformation menu' ]
]

{ #category : #accessing }
GtLSPEditorContext >> currentSelectionRanges [
	| ranges |
	ranges := OrderedCollection new.
	editor selection
		do: [ :each | each from < each to ifTrue: [ ranges add: (each from + 1 to: each to) ] ].
	^ ranges asArray
]

{ #category : #accessing }
GtLSPEditorContext >> currentVersion [
	| client |
	client := lspFile lspClient.
	(client notNil and: [ client respondsTo: #openedVersions ]) ifFalse: [ ^ nil ].
	^ client openedVersions
		at: lspFile filename asUrl printString
		ifAbsent: [ nil ]
]

{ #category : #accessing }
GtLSPEditorContext >> cursorPositions [
	^ cursorPositions copy
]

{ #category : #accessing }
GtLSPEditorContext >> directory [
	^ lspFile directory
]

{ #category : #accessing }
GtLSPEditorContext >> editor [
	^ editor
]

{ #category : #initialization }
GtLSPEditorContext >> initializeFile: aFile editor: anEditor [
	lspFile := aFile.
	editor := anEditor.
	source := editor editor text asString copy.
	selectionRanges := self currentSelectionRanges.
	cursorPositions := editor cursors collect: [ :each | each position ].
	version := self currentVersion.
	^ self
]

{ #category : #testing }
GtLSPEditorContext >> isCurrent [
	"UI process only: live text, selection and cursors belong to the editor."

	^ self isSourceCurrent
		and: [ editor editor text asString = source
				and: [ self currentSelectionRanges = selectionRanges
						and: [ (editor cursors collect: [ :each | each position ]) = cursorPositions ] ] ]
]

{ #category : #testing }
GtLSPEditorContext >> isSourceCurrent [
	"Worker-safe check: consult only the file model and client version, never the live editor."

	^ lspFile source = source and: [ self currentVersion = version ]
]

{ #category : #accessing }
GtLSPEditorContext >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPEditorContext >> selectionRanges [
	^ selectionRanges copy
]

{ #category : #accessing }
GtLSPEditorContext >> source [
	^ source copy
]
