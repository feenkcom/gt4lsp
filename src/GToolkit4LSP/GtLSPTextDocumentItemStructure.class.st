Class {
	#name : #GtLSPTextDocumentItemStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTextDocumentItemStructure >> languageId [
	"The text document's language identifier."

	^ data at: 'languageId'
]

{ #category : #accessing }
GtLSPTextDocumentItemStructure >> languageId: anObject [
	data at: 'languageId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentItemStructure >> text [
	"The content of the opened text document."

	^ data at: 'text'
]

{ #category : #accessing }
GtLSPTextDocumentItemStructure >> text: anObject [
	data at: 'text' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentItemStructure >> uri [
	"The text document's uri."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPTextDocumentItemStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentItemStructure >> version [
	"The version number of this document (it will increase after each
change, including undo/redo)."

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPTextDocumentItemStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
