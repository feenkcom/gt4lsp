Class {
	#name : #GtLSPSemanticTokensParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSemanticTokensParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary
]

{ #category : #accessing }
GtLSPSemanticTokensParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSemanticTokensParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
