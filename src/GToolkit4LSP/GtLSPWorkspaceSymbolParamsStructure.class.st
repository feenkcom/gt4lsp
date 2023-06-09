Class {
	#name : #GtLSPWorkspaceSymbolParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceSymbolParamsStructure >> query [
	"A query string to filter symbols by. Clients may send an empty
string here to request all symbols."

	^ data at: 'query'
]

{ #category : #accessing }
GtLSPWorkspaceSymbolParamsStructure >> query: anObject [
	data at: 'query' put:  (self objectFor: anObject)
]
