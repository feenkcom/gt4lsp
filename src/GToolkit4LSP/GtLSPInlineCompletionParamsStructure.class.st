Class {
	#name : #GtLSPInlineCompletionParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> context [
	"Additional information about the context in which inline completions were
requested."

	^ (data at: 'context') ifNotNil: [ :obj | GtLSPInlineCompletionContextStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPInlineCompletionParamsStructure >> create [
	data
		at: 'textDocument'
		put: GtLSPTextDocumentIdentifierStructure create asDictionary.
	data at: 'position' put: GtLSPPositionStructure create asDictionary.
	data
		at: 'context'
		put: GtLSPInlineCompletionContextStructure create asDictionary
]

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> position [
	"The position inside the text document."

	^ (data at: 'position') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> position: anObject [
	data at: 'position' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken'
]

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
