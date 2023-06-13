Class {
	#name : #GtLSPWorkspaceSymbolParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceSymbolParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken'
]

{ #category : #accessing }
GtLSPWorkspaceSymbolParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

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

{ #category : #accessing }
GtLSPWorkspaceSymbolParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken'
]

{ #category : #accessing }
GtLSPWorkspaceSymbolParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
