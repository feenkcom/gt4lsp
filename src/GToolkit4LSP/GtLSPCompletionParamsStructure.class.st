Class {
	#name : #GtLSPCompletionParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCompletionParamsStructure >> context [
	"The completion context. This is only available it the client specifies
to send this using the client capability `textDocument.completion.contextSupport === true`"

	^ (data at: 'context' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCompletionContextStructure on: obj ]
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPCompletionParamsStructure >> create [
	data
		at: 'textDocument'
		put: GtLSPTextDocumentIdentifierStructure create asDictionary.
	data at: 'position' put: GtLSPPositionStructure create asDictionary
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> position [
	"The position inside the text document."

	^ (data at: 'position') ifNotNil: [ :obj | GtLSPPositionStructure on: obj ]
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> position: anObject [
	data at: 'position' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure on: obj ]
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
