Class {
	#name : #GtLSPDocumentSymbolStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> children [
	"Children of this symbol, e.g. properties of a class."

	^ data at: 'children'
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> children: anObject [
	data at: 'children' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPDocumentSymbolStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary.
	data at: 'selectionRange' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> deprecated [
	"Indicates if this symbol is deprecated.

@deprecated Use tags instead"

	^ data at: 'deprecated'
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> deprecated: anObject [
	data at: 'deprecated' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> detail [
	"More detail for this symbol, e.g the signature of a function."

	^ data at: 'detail'
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> detail: anObject [
	data at: 'detail' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> kind [
	"The kind of this symbol."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> name [
	"The name of this symbol. Will be displayed in the user interface and therefore must not be
an empty string or a string only consisting of white spaces."

	^ data at: 'name'
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> name: anObject [
	data at: 'name' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> range [
	"The range enclosing this symbol not including leading/trailing whitespace but everything else
like comments. This information is typically used to determine if the clients cursor is
inside the symbol to reveal in the symbol in the UI."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> selectionRange [
	"The range that should be selected and revealed when this symbol is being picked, e.g the name of a function.
Must be contained by the `range`."

	^ (data at: 'selectionRange') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> selectionRange: anObject [
	data at: 'selectionRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> tags [
	"Tags for this document symbol.

@since 3.16.0"

	^ data at: 'tags'
]

{ #category : #accessing }
GtLSPDocumentSymbolStructure >> tags: anObject [
	data at: 'tags' put:  (self objectFor: anObject)
]
