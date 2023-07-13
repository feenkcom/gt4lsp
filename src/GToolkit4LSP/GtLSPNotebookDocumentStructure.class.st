Class {
	#name : #GtLSPNotebookDocumentStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> cells [
	"The cells of a notebook."

	^ data at: 'cells'
]

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> cells: anObject [
	data at: 'cells' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPNotebookDocumentStructure >> create [
	data at: 'cells' put: #()
]

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> metadata [
	"Additional metadata stored with the notebook
document.

Note: should always be an object literal (e.g. LSPObject)"

	^ data at: 'metadata' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> metadata: anObject [
	data at: 'metadata' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> notebookType [
	"The type of the notebook."

	^ data at: 'notebookType'
]

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> notebookType: anObject [
	data at: 'notebookType' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> uri [
	"The notebook document's uri."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> version [
	"The version number of this document (it will increase after each
change, including undo/redo)."

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPNotebookDocumentStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
