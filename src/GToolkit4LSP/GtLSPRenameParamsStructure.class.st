Class {
	#name : #GtLSPRenameParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPRenameParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary.
	data at: 'position' put: GtLSPPositionStructure create  asDictionary
]

{ #category : #accessing }
GtLSPRenameParamsStructure >> newName [
	"The new name of the symbol. If the given name is not valid the
request must return a {@link ResponseError} with an
appropriate message set."

	^ data at: 'newName'
]

{ #category : #accessing }
GtLSPRenameParamsStructure >> newName: anObject [
	data at: 'newName' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameParamsStructure >> position [
	"The position at which this request was sent."

	^ (data at: 'position') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPRenameParamsStructure >> position: anObject [
	data at: 'position' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameParamsStructure >> textDocument [
	"The document to rename."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPRenameParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPRenameParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
