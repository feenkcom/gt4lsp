Class {
	#name : #GtLSPRefactoringController,
	#superclass : #Object,
	#instVars : [
		'originalSource',
		'editor'
	],
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #refactoring }
GtLSPRefactoringController >> cancelRefactoring [
	self restoreText
]

{ #category : #refactoring }
GtLSPRefactoringController >> cleanUp [
	editor
		inUIProcessDo: [ editor editor text
				clearAttributes: [ :each | each class = GtRefactoringChangesAttribute ] ]
]

{ #category : #accessing }
GtLSPRefactoringController >> editor [
	^ editor
]

{ #category : #accessing }
GtLSPRefactoringController >> editor: anObject [
	editor := anObject
]

{ #category : #refactoring }
GtLSPRefactoringController >> execute [
	[ self saveSource.
	self safelyExecute ]
		on: Error
		do: [ :ex | 
			(ex isKindOf: RBRefactoringError)
				ifTrue: [ self inform: self refactoringName , ': ' , ex messageText ]
				ifFalse: [ NonInteractiveTranscript stderr
						nextPutAll: ('[{1}] {2}'
								format: {self class name.
										ex asString});
						cr.

					(ex signalerContext stack first: 20)
						do: [ :eachStackEntry | 
							NonInteractiveTranscript stderr
								nextPutAll: eachStackEntry printString;
								cr ] ].

			ex return ]
]

{ #category : #refactoring }
GtLSPRefactoringController >> refactoring [
	self subclassResponsibility
]

{ #category : #accessing }
GtLSPRefactoringController >> refactoringName [
	^ self subclassResponsibility
]

{ #category : #refactoring }
GtLSPRefactoringController >> restoreText [
	editor editor text: originalSource asRopedText
]

{ #category : #refactoring }
GtLSPRefactoringController >> safelyExecute [
	self subclassResponsibility
]

{ #category : #private }
GtLSPRefactoringController >> saveSource [
	originalSource := editor editor text copy
]
