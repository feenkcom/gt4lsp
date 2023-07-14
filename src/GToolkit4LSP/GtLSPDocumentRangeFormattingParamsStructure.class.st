Class {
	#name : #GtLSPDocumentRangeFormattingParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDocumentRangeFormattingParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary.
	data at: 'range' put: GtLSPRangeStructure create  asDictionary.
	data at: 'options' put: GtLSPFormattingOptionsStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> options [
	"The format options"

	^ (data at: 'options') ifNotNil: [ :obj | GtLSPFormattingOptionsStructure on: obj ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> options: anObject [
	data at: 'options' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> range [
	"The range to format"

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure on: obj ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> textDocument [
	"The document to format."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure on: obj ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
