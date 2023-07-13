Class {
	#name : #GtLSPHoverParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPHoverParamsStructure >> create [
	data
		at: 'textDocument'
		put: GtLSPTextDocumentIdentifierStructure create asDictionary.
	data at: 'position' put: GtLSPPositionStructure create asDictionary
]

{ #category : #accessing }
GtLSPHoverParamsStructure >> position [
	"The position inside the text document."

	^ (data at: 'position') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPHoverParamsStructure >> position: anObject [
	data at: 'position' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPHoverParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPHoverParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPHoverParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPHoverParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
