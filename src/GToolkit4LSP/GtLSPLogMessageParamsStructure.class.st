Class {
	#name : #GtLSPLogMessageParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPLogMessageParamsStructure >> message [
	"The actual message."

	^ data at: 'message'
]

{ #category : #accessing }
GtLSPLogMessageParamsStructure >> message: anObject [
	data at: 'message' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPLogMessageParamsStructure >> type [
	"The message type. See {@link MessageType}"

	^ data at: 'type'
]

{ #category : #accessing }
GtLSPLogMessageParamsStructure >> type: anObject [
	data at: 'type' put:  (self objectFor: anObject)
]
