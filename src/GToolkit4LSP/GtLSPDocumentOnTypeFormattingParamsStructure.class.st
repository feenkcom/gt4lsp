Class {
	#name : #GtLSPDocumentOnTypeFormattingParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingParamsStructure >> ch [
	"The character that has been typed that triggered the formatting
on type request. That is not necessarily the last character that
got inserted into the document since the client could auto insert
characters as well (e.g. like automatic brace completion)."

	^ data at: 'ch'
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingParamsStructure >> ch: anObject [
	data at: 'ch' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPDocumentOnTypeFormattingParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary.
	data at: 'position' put: GtLSPPositionStructure create  asDictionary.
	data at: 'options' put: GtLSPFormattingOptionsStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingParamsStructure >> options [
	"The formatting options."

	^ (data at: 'options') ifNotNil: [ :obj | GtLSPFormattingOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingParamsStructure >> options: anObject [
	data at: 'options' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingParamsStructure >> position [
	"The position around which the on type formatting should happen.
This is not necessarily the exact position where the character denoted
by the property `ch` got typed."

	^ (data at: 'position') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingParamsStructure >> position: anObject [
	data at: 'position' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingParamsStructure >> textDocument [
	"The document to format."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
