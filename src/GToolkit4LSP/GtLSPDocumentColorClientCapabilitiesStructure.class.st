Class {
	#name : #GtLSPDocumentColorClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentColorClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration. If this is set to `true`
the client supports the new `DocumentColorRegistrationOptions` return value
for the corresponding server capability as well."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPDocumentColorClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
