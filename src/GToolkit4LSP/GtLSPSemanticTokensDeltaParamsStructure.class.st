Class {
	#name : #GtLSPSemanticTokensDeltaParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSemanticTokensDeltaParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaParamsStructure >> previousResultId [
	"The result id of a previous response. The result Id can either point to a full response
or a delta response depending on what was received last."

	^ data at: 'previousResultId'
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaParamsStructure >> previousResultId: anObject [
	data at: 'previousResultId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
