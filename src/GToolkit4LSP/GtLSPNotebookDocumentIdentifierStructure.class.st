Class {
	#name : #GtLSPNotebookDocumentIdentifierStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPNotebookDocumentIdentifierStructure >> uri [
	"The notebook document's uri."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPNotebookDocumentIdentifierStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
