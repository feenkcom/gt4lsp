Class {
	#name : #GtLSPShowDocumentResultStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPShowDocumentResultStructure >> success [
	"A boolean indicating if the show was successful."

	^ data at: 'success'
]

{ #category : #accessing }
GtLSPShowDocumentResultStructure >> success: anObject [
	data at: 'success' put:  (self objectFor: anObject)
]
