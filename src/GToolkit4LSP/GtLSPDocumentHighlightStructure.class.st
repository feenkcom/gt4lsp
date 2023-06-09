Class {
	#name : #GtLSPDocumentHighlightStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDocumentHighlightStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDocumentHighlightStructure >> kind [
	"The highlight kind, default is {@link DocumentHighlightKind.Text text}."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPDocumentHighlightStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentHighlightStructure >> range [
	"The range this highlight applies to."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentHighlightStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]
