Class {
	#name : #GtLSPCodeActionParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> context [
	"Context carrying additional information."

	^ (data at: 'context') ifNotNil: [ :obj | GtLSPCodeActionContextStructure on: obj ]
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
GtLSPCodeActionParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> range [
	"The range for which the command was invoked."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure on: obj ]
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> textDocument [
	"The document in which the command was invoked."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure on: obj ]
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCodeActionParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
