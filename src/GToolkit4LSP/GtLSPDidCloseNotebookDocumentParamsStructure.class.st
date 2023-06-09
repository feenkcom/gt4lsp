Class {
	#name : #GtLSPDidCloseNotebookDocumentParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDidCloseNotebookDocumentParamsStructure >> cellTextDocuments [
	"The text documents that represent the content
of a notebook cell that got closed."

	^ data at: 'cellTextDocuments'
]

{ #category : #accessing }
GtLSPDidCloseNotebookDocumentParamsStructure >> cellTextDocuments: anObject [
	data at: 'cellTextDocuments' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPDidCloseNotebookDocumentParamsStructure >> create [
	data at: 'notebookDocument' put: GtLSPNotebookDocumentIdentifierStructure create  asDictionary.
	data at: 'cellTextDocuments' put: #()
]

{ #category : #accessing }
GtLSPDidCloseNotebookDocumentParamsStructure >> notebookDocument [
	"The notebook document that got closed."

	^ (data at: 'notebookDocument') ifNotNil: [ :obj | GtLSPNotebookDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDidCloseNotebookDocumentParamsStructure >> notebookDocument: anObject [
	data at: 'notebookDocument' put:  (self objectFor: anObject)
]
