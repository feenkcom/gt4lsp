Class {
	#name : #GtLSPTypeHierarchyItemStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPTypeHierarchyItemStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary.
	data at: 'selectionRange' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> data [
	"A data entry field that is preserved between a type hierarchy prepare and
supertypes or subtypes requests. It could also be used to identify the
type hierarchy in the server, helping improve the performance on
resolving supertypes and subtypes."

	^ data at: 'data' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> detail [
	"More detail for this item, e.g. the signature of a function."

	^ data at: 'detail' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> detail: anObject [
	data at: 'detail' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> kind [
	"The kind of this item."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> name [
	"The name of this item."

	^ data at: 'name'
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> name: anObject [
	data at: 'name' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> range [
	"The range enclosing this symbol not including leading/trailing whitespace
but everything else, e.g. comments and code."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> selectionRange [
	"The range that should be selected and revealed when this symbol is being
picked, e.g. the name of a function. Must be contained by the
{@link TypeHierarchyItem.range `range`}."

	^ (data at: 'selectionRange') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> selectionRange: anObject [
	data at: 'selectionRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> tags [
	"Tags for this item."

	^ data at: 'tags' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> tags: anObject [
	data at: 'tags' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> uri [
	"The resource identifier of this item."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPTypeHierarchyItemStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
