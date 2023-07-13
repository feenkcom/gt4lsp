Class {
	#name : #GtLSPSelectionRangeStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSelectionRangeStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPSelectionRangeStructure >> parent [
	"The parent selection range containing this range. Therefore `parent.range` must contain `this.range`."

	^ (data at: 'parent' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPSelectionRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSelectionRangeStructure >> parent: anObject [
	data at: 'parent' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSelectionRangeStructure >> range [
	"The {@link Range range} of this selection range."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSelectionRangeStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]
