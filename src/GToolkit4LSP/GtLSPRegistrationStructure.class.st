Class {
	#name : #GtLSPRegistrationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRegistrationStructure >> id [
	"The id used to register the request. The id can be used to deregister
the request again."

	^ data at: 'id'
]

{ #category : #accessing }
GtLSPRegistrationStructure >> id: anObject [
	data at: 'id' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRegistrationStructure >> method [
	"The method / capability to register for."

	^ data at: 'method'
]

{ #category : #accessing }
GtLSPRegistrationStructure >> method: anObject [
	data at: 'method' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRegistrationStructure >> registerOptions [
	"Options necessary for the registration."

	^ data at: 'registerOptions' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPRegistrationStructure >> registerOptions: anObject [
	data at: 'registerOptions' put:  (self objectFor: anObject)
]
