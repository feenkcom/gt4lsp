Class {
	#name : #GtLSPAnnotatedTextEditStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPAnnotatedTextEditStructure >> annotationId [
	"The actual identifier of the change annotation"

	^ data at: 'annotationId'
]

{ #category : #accessing }
GtLSPAnnotatedTextEditStructure >> annotationId: anObject [
	data at: 'annotationId' put:  (self objectFor: anObject)
]
