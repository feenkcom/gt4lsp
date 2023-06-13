Class {
	#name : #GtLSPSelectionRangeParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSelectionRangeParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary.
	data at: 'positions' put: #()
]

{ #category : #accessing }
GtLSPSelectionRangeParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken'
]

{ #category : #accessing }
GtLSPSelectionRangeParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSelectionRangeParamsStructure >> positions [
	"The positions inside the text document."

	^ data at: 'positions'
]

{ #category : #accessing }
GtLSPSelectionRangeParamsStructure >> positions: anObject [
	data at: 'positions' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSelectionRangeParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSelectionRangeParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSelectionRangeParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken'
]

{ #category : #accessing }
GtLSPSelectionRangeParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
