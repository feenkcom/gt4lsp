Class {
	#name : #GtLSPNotebookCellTextDocumentFilterStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPNotebookCellTextDocumentFilterStructure >> language [
	"A language id like `python`.

Will be matched against the language id of the
notebook cell document. '*' matches every language."

	^ data at: 'language' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPNotebookCellTextDocumentFilterStructure >> language: anObject [
	data at: 'language' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookCellTextDocumentFilterStructure >> notebook [
	"A filter that matches against the notebook
containing the notebook cell. If a string
value is provided it matches against the
notebook type. '*' matches every notebook."

	^ data at: 'notebook'
]

{ #category : #accessing }
GtLSPNotebookCellTextDocumentFilterStructure >> notebook: anObject [
	data at: 'notebook' put:  (self objectFor: anObject)
]
