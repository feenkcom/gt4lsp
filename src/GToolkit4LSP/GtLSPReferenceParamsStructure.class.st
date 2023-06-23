Class {
	#name : #GtLSPReferenceParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPReferenceParamsStructure >> context [
	^ (data at: 'context') ifNotNil: [ :obj | GtLSPReferenceContextStructure new data: obj ]
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPReferenceParamsStructure >> create [
	data
		at: 'textDocument'
		put: GtLSPTextDocumentIdentifierStructure create asDictionary.
	data at: 'position' put: GtLSPPositionStructure create asDictionary.
	data at: 'context' put: GtLSPReferenceContextStructure create asDictionary
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken'
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> position [
	"The position inside the text document."

	^ (data at: 'position') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> position: anObject [
	data at: 'position' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken'
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]