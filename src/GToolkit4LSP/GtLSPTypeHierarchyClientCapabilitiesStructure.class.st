Class {
	#name : #GtLSPTypeHierarchyClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTypeHierarchyClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration. If this is set to `true`
the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
return value for the corresponding server capability as well."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTypeHierarchyClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
