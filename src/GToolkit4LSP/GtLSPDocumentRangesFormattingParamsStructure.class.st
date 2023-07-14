Class {
	#name : #GtLSPDocumentRangesFormattingParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDocumentRangesFormattingParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary.
	data at: 'ranges' put: #().
	data at: 'options' put: GtLSPFormattingOptionsStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDocumentRangesFormattingParamsStructure >> options [
	"The format options"

	^ (data at: 'options') ifNotNil: [ :obj | GtLSPFormattingOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentRangesFormattingParamsStructure >> options: anObject [
	data at: 'options' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangesFormattingParamsStructure >> ranges [
	"The ranges to format"

	^ data at: 'ranges'
]

{ #category : #accessing }
GtLSPDocumentRangesFormattingParamsStructure >> ranges: anObject [
	data at: 'ranges' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangesFormattingParamsStructure >> textDocument [
	"The document to format."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentRangesFormattingParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangesFormattingParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentRangesFormattingParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
