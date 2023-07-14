Class {
	#name : #GtLSPDocumentFormattingParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDocumentFormattingParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary.
	data at: 'options' put: GtLSPFormattingOptionsStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDocumentFormattingParamsStructure >> options [
	"The format options."

	^ (data at: 'options') ifNotNil: [ :obj | GtLSPFormattingOptionsStructure on: obj ]
]

{ #category : #accessing }
GtLSPDocumentFormattingParamsStructure >> options: anObject [
	data at: 'options' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentFormattingParamsStructure >> textDocument [
	"The document to format."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure on: obj ]
]

{ #category : #accessing }
GtLSPDocumentFormattingParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentFormattingParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentFormattingParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
