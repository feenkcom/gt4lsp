Class {
	#name : #GtLSPDidOpenTextDocumentParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDidOpenTextDocumentParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentItemStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDidOpenTextDocumentParamsStructure >> textDocument [
	"The document that was opened."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentItemStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDidOpenTextDocumentParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
