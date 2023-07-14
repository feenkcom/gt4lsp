Class {
	#name : #GtLSPSelectionRangeClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSelectionRangeClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration for selection range providers. If this is set to `true`
the client supports the new `SelectionRangeRegistrationOptions` return value for the corresponding server
capability as well."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSelectionRangeClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
