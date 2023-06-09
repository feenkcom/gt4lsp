Class {
	#name : #GtLSPShowMessageParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPShowMessageParamsStructure >> message [
	"The actual message."

	^ data at: 'message'
]

{ #category : #accessing }
GtLSPShowMessageParamsStructure >> message: anObject [
	data at: 'message' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPShowMessageParamsStructure >> type [
	"The message type. See {@link MessageType}"

	^ data at: 'type'
]

{ #category : #accessing }
GtLSPShowMessageParamsStructure >> type: anObject [
	data at: 'type' put:  (self objectFor: anObject)
]
