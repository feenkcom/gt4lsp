Class {
	#name : #GtLSPVersionedTextDocumentIdentifierStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPVersionedTextDocumentIdentifierStructure >> uri [
	"The text document's uri."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPVersionedTextDocumentIdentifierStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPVersionedTextDocumentIdentifierStructure >> version [
	"The version number of this document."

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPVersionedTextDocumentIdentifierStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
