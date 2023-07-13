Class {
	#name : #GtLSPDocumentSymbolClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> dynamicRegistration [
	"Whether document symbol supports dynamic registration."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> hierarchicalDocumentSymbolSupport [
	"The client supports hierarchical document symbols."

	^ data at: 'hierarchicalDocumentSymbolSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> hierarchicalDocumentSymbolSupport: anObject [
	data at: 'hierarchicalDocumentSymbolSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> labelSupport [
	"The client supports an additional label presented in the UI when
registering a document symbol provider.

@since 3.16.0"

	^ data at: 'labelSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> labelSupport: anObject [
	data at: 'labelSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> symbolKind [
	"Specific capabilities for the `SymbolKind` in the
`textDocument/documentSymbol` request."

	^ data at: 'symbolKind' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> symbolKind: anObject [
	data at: 'symbolKind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> tagSupport [
	"The client supports tags on `SymbolInformation`. Tags are supported on
`DocumentSymbol` if `hierarchicalDocumentSymbolSupport` is set to true.
Clients supporting tags have to handle unknown tags gracefully.

@since 3.16.0"

	^ data at: 'tagSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentSymbolClientCapabilitiesStructure >> tagSupport: anObject [
	data at: 'tagSupport' put:  (self objectFor: anObject)
]
