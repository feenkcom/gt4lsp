Class {
	#name : #GtLSPTextDocumentIdentifierStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTextDocumentIdentifierStructure >> uri [
	"The text document's uri."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPTextDocumentIdentifierStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
