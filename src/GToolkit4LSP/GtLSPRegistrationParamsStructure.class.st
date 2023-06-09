Class {
	#name : #GtLSPRegistrationParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPRegistrationParamsStructure >> create [
	data at: 'registrations' put: #()
]

{ #category : #accessing }
GtLSPRegistrationParamsStructure >> registrations [
	^ data at: 'registrations'
]

{ #category : #accessing }
GtLSPRegistrationParamsStructure >> registrations: anObject [
	data at: 'registrations' put:  (self objectFor: anObject)
]
