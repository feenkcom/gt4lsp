Class {
	#name : #GtLSPCallHierarchyItemStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPCallHierarchyItemStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary.
	data at: 'selectionRange' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> data [
	"A data entry field that is preserved between a call hierarchy prepare and
incoming calls or outgoing calls requests."

	^ data at: 'data' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> detail [
	"More detail for this item, e.g. the signature of a function."

	^ data at: 'detail' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> detail: anObject [
	data at: 'detail' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> kind [
	"The kind of this item."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> name [
	"The name of this item."

	^ data at: 'name'
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> name: anObject [
	data at: 'name' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> range [
	"The range enclosing this symbol not including leading/trailing whitespace but everything else, e.g. comments and code."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> selectionRange [
	"The range that should be selected and revealed when this symbol is being picked, e.g. the name of a function.
Must be contained by the {@link CallHierarchyItem.range `range`}."

	^ (data at: 'selectionRange') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> selectionRange: anObject [
	data at: 'selectionRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> tags [
	"Tags for this item."

	^ data at: 'tags' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> tags: anObject [
	data at: 'tags' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> uri [
	"The resource identifier of this item."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPCallHierarchyItemStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
