Class {
	#name : #GtLSPCodeActionParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> context [
	"Context carrying additional information."

	^ (data at: 'context') ifNotNil: [ :obj | GtLSPCodeActionContextStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPCodeActionParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary.
	data at: 'range' put: GtLSPRangeStructure create  asDictionary.
	data at: 'context' put: GtLSPCodeActionContextStructure create  asDictionary
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> range [
	"The range for which the command was invoked."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> textDocument [
	"The document in which the command was invoked."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
