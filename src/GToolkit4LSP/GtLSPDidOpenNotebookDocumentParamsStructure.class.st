Class {
	#name : #GtLSPDidOpenNotebookDocumentParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDidOpenNotebookDocumentParamsStructure >> cellTextDocuments [
	"The text documents that represent the content
of a notebook cell."

	^ data at: 'cellTextDocuments'
]

{ #category : #accessing }
GtLSPDidOpenNotebookDocumentParamsStructure >> cellTextDocuments: anObject [
	data at: 'cellTextDocuments' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPDidOpenNotebookDocumentParamsStructure >> create [
	data at: 'notebookDocument' put: GtLSPNotebookDocumentStructure create  asDictionary.
	data at: 'cellTextDocuments' put: #()
]

{ #category : #accessing }
GtLSPDidOpenNotebookDocumentParamsStructure >> notebookDocument [
	"The notebook document that got opened."

	^ (data at: 'notebookDocument') ifNotNil: [ :obj | GtLSPNotebookDocumentStructure on: obj ]
]

{ #category : #accessing }
GtLSPDidOpenNotebookDocumentParamsStructure >> notebookDocument: anObject [
	data at: 'notebookDocument' put:  (self objectFor: anObject)
]
