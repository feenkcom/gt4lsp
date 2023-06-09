Class {
	#name : #GtLSPResourceOperationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPResourceOperationStructure >> annotationId [
	"An optional annotation identifier describing the operation.

@since 3.16.0"

	^ data at: 'annotationId'
]

{ #category : #accessing }
GtLSPResourceOperationStructure >> annotationId: anObject [
	data at: 'annotationId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPResourceOperationStructure >> kind [
	"The resource operation kind."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPResourceOperationStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]
