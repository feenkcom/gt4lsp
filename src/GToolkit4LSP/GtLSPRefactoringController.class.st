Class {
	#name : #GtLSPRefactoringController,
	#superclass : #Object,
	#instVars : [
		'originalSource',
		'editor',
		'lspCoder'
	],
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #accessing }
GtLSPRefactoringController >> allowSave [
	lspCoder ifNotNil: [ lspCoder allowSave ]
]

{ #category : #refactoring }
GtLSPRefactoringController >> cancelRefactoring [
	self restoreText.
	self cleanUp
]

{ #category : #refactoring }
GtLSPRefactoringController >> cleanUp [
	self removeRefactoringAttribute
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

{ #category : #accessing }
GtLSPRefactoringController >> lspCoder [
	^ lspCoder
]

{ #category : #accessing }
GtLSPRefactoringController >> lspCoder: anObject [
	lspCoder := anObject
]

{ #category : #accessing }
GtLSPRefactoringController >> preventSave [
	lspCoder ifNotNil: [ lspCoder preventSave ]
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
GtLSPRefactoringController >> removeRefactoringAttribute [
	editor
		inUIProcessDo: [ editor editor text
				clearAttributes: [ :each | each class = GtRefactoringChangesAttribute ] ]
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

{ #category : #accessing }
GtLSPRefactoringController >> setText: aString [
	editor deselecter
		all;
		deselect.
	editor editor text: aString asRopedText
]
