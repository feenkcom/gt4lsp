Class {
	#name : #GtLSPFileModel,
	#superclass : #GtLSPModel,
	#instVars : [
		'originalSource',
		'source',
		'isOpen',
		'directory'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPFileModel >> cancel [
	self isModified ifFalse: [ ^ self ].
	self source: self originalSource
]

{ #category : #actions }
GtLSPFileModel >> close [
	isOpen ifFalse: [ ^ self ].
	self lspClient didClose: filename.
	isOpen := false
]

{ #category : #accessing }
GtLSPFileModel >> directory [
	^ directory
]

{ #category : #accessing }
GtLSPFileModel >> directory: lspDirectory [
	directory := lspDirectory
]

{ #category : #accessing }
GtLSPFileModel >> editor [
	| editor aptitude |
	self open.
	editor := GtLSPEditor new.
	aptitude := GtLSPEditorAptitude new.
	aptitude lspClient: self lspClient.
	aptitude lspFile: self.
	self styler ifNotNil: [ :styler | aptitude styler: styler ].
	editor aptitude: aptitude.
	editor editor text: self source asRopedText.
	^ editor
]

{ #category : #actions }
GtLSPFileModel >> fileUpdated [
	| modified |
	modified := self isModified.
	originalSource := nil.
	modified
		ifFalse: [ self source: self originalSource.
			self isOpen
				ifTrue: [ self lspClient
						didChange: filename
						with: {Dictionary new at: 'text' put: source} ] ]
]

{ #category : #initialization }
GtLSPFileModel >> initialize [
	super initialize.
	isOpen := false
]

{ #category : #testing }
GtLSPFileModel >> isModified [
	^ self originalSource ~= self source
]

{ #category : #testing }
GtLSPFileModel >> isOpen [
	^ isOpen
]

{ #category : #accessing }
GtLSPFileModel >> lspClient [
	^ directory lspClient
]

{ #category : #accessing }
GtLSPFileModel >> lspDirectory [
	^ directory
]

{ #category : #actions }
GtLSPFileModel >> open [
	isOpen ifTrue: [ ^ self ].
	self lspClient didOpen: filename withContents: self source.
	isOpen := true
]

{ #category : #accessing }
GtLSPFileModel >> originalSource [
	^ originalSource ifNil: [ originalSource := filename contents ]
]

{ #category : #accessing }
GtLSPFileModel >> originalSource: aString [
	originalSource := aString
]

{ #category : #actions }
GtLSPFileModel >> saveFile [
	self isModified ifFalse: [ ^ self ].
	filename
		ensureDelete;
		writeStreamDo: [ :stream | stream nextPutAll: source ].
	originalSource := self source.
	self announce: (GtLSPFileSaved new lspFile: self)
]

{ #category : #accessing }
GtLSPFileModel >> source [
	^ source ifNil: [ source := self originalSource ]
]

{ #category : #accessing }
GtLSPFileModel >> source: aString [
	| oldSource |
	source = aString ifTrue: [ ^ self ].
	oldSource := source.
	source := aString.
	self
		announce: (GtLSPFileSourceChanged new
				lspFile: self;
				oldSource: oldSource;
				yourself)
]

{ #category : #accessing }
GtLSPFileModel >> styler [
	^ directory styler
]