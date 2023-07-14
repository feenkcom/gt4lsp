Class {
	#name : #GtLSPDiagnosticClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDiagnosticClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration. If this is set to `true`
the client supports the new `(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
return value for the corresponding server capability as well."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticClientCapabilitiesStructure >> relatedDocumentSupport [
	"Whether the clients supports related documents for document diagnostic pulls."

	^ data at: 'relatedDocumentSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticClientCapabilitiesStructure >> relatedDocumentSupport: anObject [
	data at: 'relatedDocumentSupport' put:  (self objectFor: anObject)
]
