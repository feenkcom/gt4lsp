Class {
	#name : #GtLSPMonikerClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPMonikerClientCapabilitiesStructure >> dynamicRegistration [
	"Whether moniker supports dynamic registration. If this is set to `true`
the client supports the new `MonikerRegistrationOptions` return value
for the corresponding server capability as well."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPMonikerClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
