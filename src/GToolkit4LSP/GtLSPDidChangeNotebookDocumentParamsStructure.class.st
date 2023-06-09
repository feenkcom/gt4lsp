Class {
	#name : #GtLSPDidChangeNotebookDocumentParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDidChangeNotebookDocumentParamsStructure >> change [
	"The actual changes to the notebook document.

The changes describe single state changes to the notebook document.
So if there are two changes c1 (at array index 0) and c2 (at array
index 1) for a notebook in state S then c1 moves the notebook from
S to S' and c2 from S' to S''. So c1 is computed on the state S and
c2 is computed on the state S'.

To mirror the content of a notebook using change events use the following approach:
- start with the same initial content
- apply the 'notebookDocument/didChange' notifications in the order you receive them.
- apply the `NotebookChangeEvent`s in a single notification in the order
  you receive them."

	^ (data at: 'change') ifNotNil: [ :obj | GtLSPNotebookDocumentChangeEventStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDidChangeNotebookDocumentParamsStructure >> change: anObject [
	data at: 'change' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPDidChangeNotebookDocumentParamsStructure >> create [
	data at: 'notebookDocument' put: GtLSPVersionedNotebookDocumentIdentifierStructure create  asDictionary.
	data at: 'change' put: GtLSPNotebookDocumentChangeEventStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDidChangeNotebookDocumentParamsStructure >> notebookDocument [
	"The notebook document that did change. The version number points
to the version after all provided changes have been applied. If
only the text document content of a cell changes the notebook version
doesn't necessarily have to change."

	^ (data at: 'notebookDocument') ifNotNil: [ :obj | GtLSPVersionedNotebookDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDidChangeNotebookDocumentParamsStructure >> notebookDocument: anObject [
	data at: 'notebookDocument' put:  (self objectFor: anObject)
]
