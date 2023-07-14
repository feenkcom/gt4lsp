Class {
	#name : #GtLSPNotebookCellStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPNotebookCellStructure >> document [
	"The URI of the cell's text document
content."

	^ data at: 'document'
]

{ #category : #accessing }
GtLSPNotebookCellStructure >> document: anObject [
	data at: 'document' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookCellStructure >> executionSummary [
	"Additional execution summary information
if supported by the client."

	^ (data at: 'executionSummary' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPExecutionSummaryStructure on: obj ]
]

{ #category : #accessing }
GtLSPNotebookCellStructure >> executionSummary: anObject [
	data at: 'executionSummary' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookCellStructure >> kind [
	"The cell's kind"

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPNotebookCellStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookCellStructure >> metadata [
	"Additional metadata stored with the cell.

Note: should always be an object literal (e.g. LSPObject)"

	^ data at: 'metadata' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPNotebookCellStructure >> metadata: anObject [
	data at: 'metadata' put:  (self objectFor: anObject)
]
