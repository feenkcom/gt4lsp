Class {
	#name : #GtLSPWillSaveTextDocumentParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPWillSaveTextDocumentParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary
]

{ #category : #accessing }
GtLSPWillSaveTextDocumentParamsStructure >> reason [
	"The 'TextDocumentSaveReason'."

	^ data at: 'reason'
]

{ #category : #accessing }
GtLSPWillSaveTextDocumentParamsStructure >> reason: anObject [
	data at: 'reason' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWillSaveTextDocumentParamsStructure >> textDocument [
	"The document that will be saved."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWillSaveTextDocumentParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
