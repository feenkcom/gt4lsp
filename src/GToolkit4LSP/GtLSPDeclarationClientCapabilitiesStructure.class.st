Class {
	#name : #GtLSPDeclarationClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDeclarationClientCapabilitiesStructure >> dynamicRegistration [
	"Whether declaration supports dynamic registration. If this is set to `true`
the client supports the new `DeclarationRegistrationOptions` return value
for the corresponding server capability as well."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDeclarationClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDeclarationClientCapabilitiesStructure >> linkSupport [
	"The client supports additional metadata in the form of declaration links."

	^ data at: 'linkSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDeclarationClientCapabilitiesStructure >> linkSupport: anObject [
	data at: 'linkSupport' put:  (self objectFor: anObject)
]
