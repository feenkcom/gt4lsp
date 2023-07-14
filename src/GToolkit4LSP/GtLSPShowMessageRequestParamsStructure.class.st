Class {
	#name : #GtLSPShowMessageRequestParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPShowMessageRequestParamsStructure >> actions [
	"The message action items to present."

	^ data at: 'actions' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPShowMessageRequestParamsStructure >> actions: anObject [
	data at: 'actions' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPShowMessageRequestParamsStructure >> message [
	"The actual message."

	^ data at: 'message'
]

{ #category : #accessing }
GtLSPShowMessageRequestParamsStructure >> message: anObject [
	data at: 'message' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPShowMessageRequestParamsStructure >> type [
	"The message type. See {@link MessageType}"

	^ data at: 'type'
]

{ #category : #accessing }
GtLSPShowMessageRequestParamsStructure >> type: anObject [
	data at: 'type' put:  (self objectFor: anObject)
]
