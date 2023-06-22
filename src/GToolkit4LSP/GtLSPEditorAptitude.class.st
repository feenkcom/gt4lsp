Class {
	#name : #GtLSPEditorAptitude,
	#superclass : #BrGlamorousCodeEditorAptitude,
	#instVars : [
		'lspClient',
		'lspFile'
	],
	#category : #'GToolkit4LSP-Aptitudes'
}

{ #category : #accessing }
GtLSPEditorAptitude >> filename [
	^ lspFile filename
]

{ #category : #initialization }
GtLSPEditorAptitude >> initialize [
	| controller |
	super initialize.
	self
		addChange: (BrLookChange new
				up: [ :e | 
					| completion |
					widget editor
						when: GtLSPTextDocumentContentChange
						do: [ :evt | self updateServerWith: evt events ].
					self styler: RustParser gtStyler.
					widget viewModel styler: styler.
					completion := GtLSPCompletionStrategy new.
					completion
						editorModel: widget editor;
						lspFile: lspFile;
						lspClient: lspClient.
					controller := GtCompletionController on: widget strategy: completion.
					controller install ];
				down: [ :e | 
					widget editor
						removeEventHandlersSuchThat: [ :each | each eventClass = GtLSPTextDocumentContentChange ].
					controller ifNotNil: [ controller uninstall ] ];
				yourself)
]

{ #category : #accessing }
GtLSPEditorAptitude >> lspClient [
	^ lspClient
]

{ #category : #accessing }
GtLSPEditorAptitude >> lspClient: anObject [
	lspClient := anObject
]

{ #category : #accessing }
GtLSPEditorAptitude >> lspFile: aLSPFile [
	lspFile ifNotNil: [ lspFile announcer unsubscribe: self ].
	lspFile := aLSPFile.
	lspFile
		ifNotNil: [ lspFile announcer weak
				when: GtLSPFileSourceChanged
				send: #updateText:
				to: self ]
]

{ #category : #initialization }
GtLSPEditorAptitude >> updateServerWith: anArray [
	lspClient didChange: lspFile filename with: anArray
]

{ #category : #accessing }
GtLSPEditorAptitude >> updateText: anAnnouncement [
	widget
		ifNotNil: [ widget
				inUIProcessDo: [ widget editor text asString ~= lspFile source
						ifTrue: [ widget editor text: lspFile source asRopedText ] ] ]
]
