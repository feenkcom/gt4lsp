Class {
	#name : #GtLSPWorkspaceSymbolStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> data [
	"A data entry field that is preserved on a workspace symbol between a
workspace symbol request and a workspace symbol resolve request."

	^ data at: 'data'
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> location [
	"The location of the symbol. Whether a server is allowed to
return a location without a range depends on the client
capability `workspace.symbol.resolveSupport`.

See SymbolInformation#location for more details."

	^ data at: 'location'
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> location: anObject [
	data at: 'location' put:  (self objectFor: anObject)
]
