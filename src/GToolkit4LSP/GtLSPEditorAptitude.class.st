Class {
	#name : #GtLSPEditorAptitude,
	#superclass : #BrGlamorousCodeEditorAptitude,
	#instVars : [
		'lspClient',
		'filename'
	],
	#category : #'GToolkit4LSP-Aptitudes'
}

{ #category : #accessing }
GtLSPEditorAptitude >> filename [
	^ filename
]

{ #category : #accessing }
GtLSPEditorAptitude >> filename: anObject [
	filename := anObject
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
						lspFile: filename;
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

{ #category : #initialization }
GtLSPEditorAptitude >> updateServerWith: anArray [
	lspClient didChange: filename with: anArray
]
