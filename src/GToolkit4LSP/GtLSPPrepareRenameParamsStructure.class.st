Class {
	#name : #GtLSPPrepareRenameParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPPrepareRenameParamsStructure >> create [
	data
		at: 'textDocument'
		put: GtLSPTextDocumentIdentifierStructure create asDictionary.
	data at: 'position' put: GtLSPPositionStructure create asDictionary
]

{ #category : #accessing }
GtLSPPrepareRenameParamsStructure >> position [
	"The position inside the text document."

	^ (data at: 'position') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPPrepareRenameParamsStructure >> position: anObject [
	data at: 'position' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPrepareRenameParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPPrepareRenameParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPrepareRenameParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken'
]

{ #category : #accessing }
GtLSPPrepareRenameParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
