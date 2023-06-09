Class {
	#name : #GtLSPVersionedNotebookDocumentIdentifierStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPVersionedNotebookDocumentIdentifierStructure >> uri [
	"The notebook document's uri."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPVersionedNotebookDocumentIdentifierStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPVersionedNotebookDocumentIdentifierStructure >> version [
	"The version number of this notebook document."

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPVersionedNotebookDocumentIdentifierStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
