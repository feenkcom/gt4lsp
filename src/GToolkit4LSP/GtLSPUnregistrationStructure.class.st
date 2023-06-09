Class {
	#name : #GtLSPUnregistrationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPUnregistrationStructure >> id [
	"The id used to unregister the request or notification. Usually an id
provided during the register request."

	^ data at: 'id'
]

{ #category : #accessing }
GtLSPUnregistrationStructure >> id: anObject [
	data at: 'id' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPUnregistrationStructure >> method [
	"The method to unregister for."

	^ data at: 'method'
]

{ #category : #accessing }
GtLSPUnregistrationStructure >> method: anObject [
	data at: 'method' put:  (self objectFor: anObject)
]
