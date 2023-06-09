Class {
	#name : #GtLSPDidSaveNotebookDocumentParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDidSaveNotebookDocumentParamsStructure >> create [
	data at: 'notebookDocument' put: GtLSPNotebookDocumentIdentifierStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDidSaveNotebookDocumentParamsStructure >> notebookDocument [
	"The notebook document that got saved."

	^ (data at: 'notebookDocument') ifNotNil: [ :obj | GtLSPNotebookDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDidSaveNotebookDocumentParamsStructure >> notebookDocument: anObject [
	data at: 'notebookDocument' put:  (self objectFor: anObject)
]
