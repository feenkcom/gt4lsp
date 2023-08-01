Class {
	#name : #GtLSPRenameRefactoring,
	#superclass : #GtLSPRefactoring,
	#instVars : [
		'location',
		'newName',
		'lspFile'
	],
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #accessing }
GtLSPRenameRefactoring >> location [
	^ location
]

{ #category : #accessing }
GtLSPRenameRefactoring >> location: anObject [
	location := anObject
]

{ #category : #accessing }
GtLSPRenameRefactoring >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPRenameRefactoring >> lspFile: aLSPFileModel [
	lspFile := aLSPFileModel
]

{ #category : #accessing }
GtLSPRenameRefactoring >> newName [
	^ newName
]

{ #category : #accessing }
GtLSPRenameRefactoring >> newName: aString [
	newName := aString
]

{ #category : #accessing }
GtLSPRenameRefactoring >> preconditions [
	^ RBCondition empty
]

{ #category : #accessing }
GtLSPRenameRefactoring >> transform [
	| semaphore errorMessage |
	self changes name: 'Rename'.
	semaphore := Semaphore new.
	self lspClient
		renameFor: self lspFile filename
		at: location
		to: newName
		do: [ :changes | 
			self applyChanges: changes documentChanges.
			semaphore signal ]
		onError: [ :error | 
			errorMessage := (error at: 'error' ifAbsent: [ Dictionary new ])
					at: 'message'
					ifAbsent: [ 'Refactoring error' ].
			semaphore signal ].
	semaphore wait.
	errorMessage ifNotNil: [ self refactoringError: errorMessage ]
]
