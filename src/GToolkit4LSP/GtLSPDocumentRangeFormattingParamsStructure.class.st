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

	^ (data at: 'options') ifNotNil: [ :obj | GtLSPFormattingOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> options: anObject [
	data at: 'options' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> range [
	"The range to format"

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> textDocument [
	"The document to format."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
