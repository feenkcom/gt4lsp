Class {
	#name : #GtLSPDocumentLinkClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentLinkClientCapabilitiesStructure >> dynamicRegistration [
	"Whether document link supports dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPDocumentLinkClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentLinkClientCapabilitiesStructure >> tooltipSupport [
	"Whether the client supports the `tooltip` property on `DocumentLink`.

@since 3.15.0"

	^ data at: 'tooltipSupport'
]

{ #category : #accessing }
GtLSPDocumentLinkClientCapabilitiesStructure >> tooltipSupport: anObject [
	data at: 'tooltipSupport' put:  (self objectFor: anObject)
]
