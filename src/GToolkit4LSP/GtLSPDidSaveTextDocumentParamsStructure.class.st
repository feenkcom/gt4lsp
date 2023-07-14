Class {
	#name : #GtLSPDidSaveTextDocumentParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDidSaveTextDocumentParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDidSaveTextDocumentParamsStructure >> text [
	"Optional the content when saved. Depends on the includeText value
when the save notification was requested."

	^ data at: 'text' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDidSaveTextDocumentParamsStructure >> text: anObject [
	data at: 'text' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDidSaveTextDocumentParamsStructure >> textDocument [
	"The document that was saved."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure on: obj ]
]

{ #category : #accessing }
GtLSPDidSaveTextDocumentParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
