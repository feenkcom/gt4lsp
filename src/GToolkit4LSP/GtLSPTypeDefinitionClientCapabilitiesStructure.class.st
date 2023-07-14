Class {
	#name : #GtLSPTypeDefinitionClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTypeDefinitionClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration. If this is set to `true`
the client supports the new `TypeDefinitionRegistrationOptions` return value
for the corresponding server capability as well."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTypeDefinitionClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeDefinitionClientCapabilitiesStructure >> linkSupport [
	"The client supports additional metadata in the form of definition links.

Since 3.14.0"

	^ data at: 'linkSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTypeDefinitionClientCapabilitiesStructure >> linkSupport: anObject [
	data at: 'linkSupport' put:  (self objectFor: anObject)
]
