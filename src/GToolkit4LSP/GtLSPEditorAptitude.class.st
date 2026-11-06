Class {
	#name : #GtLSPEditorAptitude,
	#superclass : #BrGlamorousCodeEditorAptitude,
	#instVars : [
		'lspFile',
		'synchronizingText'
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
						do: [ :evt | self updateServerWith: evt ].
					styler
						ifNotNil: [ widget editor styler: styler.
							widget viewModel styler: styler ].
					completion := GtLSPCompletionStrategy new.
					completion
						editorModel: widget editor;
						lspFile: lspFile.
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
	^ lspFile ifNotNil: [ lspFile lspClient ]
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

{ #category : #updating }
GtLSPEditorAptitude >> updateServerWith: lspTextDocumentContentChanged [
	synchronizingText == true ifTrue: [ ^ self ].
	self lspClient
		ifNotNil: [ :client | 
			client supportsIncrementalUpdates
				ifTrue: [ client didChange: self filename with: lspTextDocumentContentChanged events ]
				ifFalse: [ client
						didChange: self filename
						with: {Dictionary new
									at: 'text' put: lspTextDocumentContentChanged text asString;
									yourself} ] ]
]

{ #category : #updating }
GtLSPEditorAptitude >> updateText: anAnnouncement [
	widget
		ifNotNil: [ widget
				inUIProcessDo: [ widget editor text asString ~= lspFile source
						ifTrue: [ synchronizingText := true.
							[ widget editor text: lspFile source asRopedText ]
								ensure: [ synchronizingText := false ] ] ] ]
]
