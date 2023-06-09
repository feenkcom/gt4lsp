Class {
	#name : #GtLSPSignatureHelpClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSignatureHelpClientCapabilitiesStructure >> contextSupport [
	"The client supports to send additional context information for a
`textDocument/signatureHelp` request. A client that opts into
contextSupport will also support the `retriggerCharacters` on
`SignatureHelpOptions`.

@since 3.15.0"

	^ data at: 'contextSupport'
]

{ #category : #accessing }
GtLSPSignatureHelpClientCapabilitiesStructure >> contextSupport: anObject [
	data at: 'contextSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpClientCapabilitiesStructure >> dynamicRegistration [
	"Whether signature help supports dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPSignatureHelpClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpClientCapabilitiesStructure >> signatureInformation [
	"The client supports the following `SignatureInformation`
specific properties."

	^ data at: 'signatureInformation'
]

{ #category : #accessing }
GtLSPSignatureHelpClientCapabilitiesStructure >> signatureInformation: anObject [
	data at: 'signatureInformation' put:  (self objectFor: anObject)
]
