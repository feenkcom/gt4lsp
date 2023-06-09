Class {
	#name : #GtLSPTextDocumentEditStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPTextDocumentEditStructure >> create [
	data at: 'textDocument' put: GtLSPOptionalVersionedTextDocumentIdentifierStructure create  asDictionary.
	data at: 'edits' put: #()
]

{ #category : #accessing }
GtLSPTextDocumentEditStructure >> edits [
	"The edits to be applied.

@since 3.16.0 - support for AnnotatedTextEdit. This is guarded using a
client capability."

	^ data at: 'edits'
]

{ #category : #accessing }
GtLSPTextDocumentEditStructure >> edits: anObject [
	data at: 'edits' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentEditStructure >> textDocument [
	"The text document to change."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPOptionalVersionedTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentEditStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
