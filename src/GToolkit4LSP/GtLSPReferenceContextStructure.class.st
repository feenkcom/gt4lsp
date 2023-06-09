Class {
	#name : #GtLSPReferenceContextStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPReferenceContextStructure >> includeDeclaration [
	"Include the declaration of the current symbol."

	^ data at: 'includeDeclaration'
]

{ #category : #accessing }
GtLSPReferenceContextStructure >> includeDeclaration: anObject [
	data at: 'includeDeclaration' put:  (self objectFor: anObject)
]
