Class {
	#name : #GtLSPCancelParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCancelParamsStructure >> id [
	"The request id to cancel."

	^ data at: 'id'
]

{ #category : #accessing }
GtLSPCancelParamsStructure >> id: anObject [
	data at: 'id' put:  (self objectFor: anObject)
]
