Class {
	#name : #GtLSPImplementationClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPImplementationClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration. If this is set to `true`
the client supports the new `ImplementationRegistrationOptions` return value
for the corresponding server capability as well."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPImplementationClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPImplementationClientCapabilitiesStructure >> linkSupport [
	"The client supports additional metadata in the form of definition links.

@since 3.14.0"

	^ data at: 'linkSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPImplementationClientCapabilitiesStructure >> linkSupport: anObject [
	data at: 'linkSupport' put:  (self objectFor: anObject)
]
