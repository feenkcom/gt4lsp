Class {
	#name : #GtLSPReferenceClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPReferenceClientCapabilitiesStructure >> dynamicRegistration [
	"Whether references supports dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPReferenceClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
