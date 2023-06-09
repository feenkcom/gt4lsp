Class {
	#name : #GtLSPInlineValueParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlineValueParamsStructure >> context [
	"Additional information about the context in which inline values were
requested."

	^ (data at: 'context') ifNotNil: [ :obj | GtLSPInlineValueContextStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineValueParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPInlineValueParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary.
	data at: 'range' put: GtLSPRangeStructure create  asDictionary.
	data at: 'context' put: GtLSPInlineValueContextStructure create  asDictionary
]

{ #category : #accessing }
GtLSPInlineValueParamsStructure >> range [
	"The document range for which inline values should be computed."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineValueParamsStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineValueParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineValueParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
