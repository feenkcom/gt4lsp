Class {
	#name : #GtLSPNotebookDocumentChangeEventStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPNotebookDocumentChangeEventStructure >> cells [
	"Changes to cells"

	^ data at: 'cells'
]

{ #category : #accessing }
GtLSPNotebookDocumentChangeEventStructure >> cells: anObject [
	data at: 'cells' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookDocumentChangeEventStructure >> metadata [
	"The changed meta data if any.

Note: should always be an object literal (e.g. LSPObject)"

	^ data at: 'metadata'
]

{ #category : #accessing }
GtLSPNotebookDocumentChangeEventStructure >> metadata: anObject [
	data at: 'metadata' put:  (self objectFor: anObject)
]
