Class {
	#name : #GtLSPWorkspaceSymbolClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceSymbolClientCapabilitiesStructure >> dynamicRegistration [
	"Symbol request supports dynamic registration."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceSymbolClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolClientCapabilitiesStructure >> resolveSupport [
	"The client support partial workspace symbols. The client will send the
request `workspaceSymbol/resolve` to the server to resolve additional
properties.

@since 3.17.0"

	^ data at: 'resolveSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceSymbolClientCapabilitiesStructure >> resolveSupport: anObject [
	data at: 'resolveSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolClientCapabilitiesStructure >> symbolKind [
	"Specific capabilities for the `SymbolKind` in the `workspace/symbol` request."

	^ data at: 'symbolKind' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceSymbolClientCapabilitiesStructure >> symbolKind: anObject [
	data at: 'symbolKind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolClientCapabilitiesStructure >> tagSupport [
	"The client supports tags on `SymbolInformation`.
Clients supporting tags have to handle unknown tags gracefully.

@since 3.16.0"

	^ data at: 'tagSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceSymbolClientCapabilitiesStructure >> tagSupport: anObject [
	data at: 'tagSupport' put:  (self objectFor: anObject)
]
