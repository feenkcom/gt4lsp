Class {
	#name : #GtLSPStaticRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPStaticRegistrationOptionsStructure >> id [
	"The id used to register the request. The id can be used to deregister
the request again. See also Registration#id."

	^ data at: 'id' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPStaticRegistrationOptionsStructure >> id: anObject [
	data at: 'id' put:  (self objectFor: anObject)
]
