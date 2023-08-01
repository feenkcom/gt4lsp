Class {
	#name : #GtLSPRefactoring,
	#superclass : #RBRefactoring,
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #'instance creation' }
GtLSPRefactoring class >> on: aLSPDirectoryModel [
	^ self new
		model: (GtLSPRefactoringModel new
				lspDirectory: aLSPDirectoryModel;
				yourself);
		yourself
]

{ #category : #accessing }
GtLSPRefactoring >> applyChange: change [
	| file |
	(change includesKey: 'kind') ifTrue: [ self error: 'Not yet supported' ].
	file := self lspDirectory fileForUri: ((change at: 'textDocument') at: 'uri').
	self editFile: file with: (change at: 'edits')
]

{ #category : #accessing }
GtLSPRefactoring >> applyChanges: changes [
	changes do: [ :each | self applyChange: each ]
]

{ #category : #accessing }
GtLSPRefactoring >> editFile: lspFile with: aCollection [
	| editedSource |
	editedSource := SmaCCString on: lspFile source.
	aCollection
		do: [ :each | 
			| interval |
			interval := lspFile source gtLSPIntervalForRange: (each at: 'range').
			editedSource
				replaceFrom: interval first
				to: interval last
				with: (each at: 'newText') ].
	self changes
		addChange: (GtLSPFileChange new
				name: lspFile filename basename;
				lspFile: lspFile;
				newSource: editedSource asString;
				yourself)
]

{ #category : #accessing }
GtLSPRefactoring >> lspClient [
	^ self lspDirectory lspClient
]

{ #category : #accessing }
GtLSPRefactoring >> lspDirectory [
	^ self model lspDirectory
]
