Class {
	#name : #GtLSPRefactoringModel,
	#superclass : #Object,
	#instVars : [
		'changes',
		'lspDirectory',
		'name'
	],
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #accessing }
GtLSPRefactoringModel >> changes [
	^ changes
]

{ #category : #accessing }
GtLSPRefactoringModel >> changes: anObject [
	changes := anObject
]

{ #category : #accessing }
GtLSPRefactoringModel >> initialize [
	super initialize.
	changes := RBCompositeRefactoryChange new
]

{ #category : #accessing }
GtLSPRefactoringModel >> lspDirectory [
	^ lspDirectory
]

{ #category : #accessing }
GtLSPRefactoringModel >> lspDirectory: anObject [
	lspDirectory := anObject
]

{ #category : #accessing }
GtLSPRefactoringModel >> name [
	^ name
]

{ #category : #accessing }
GtLSPRefactoringModel >> name: anObject [
	name := anObject
]
