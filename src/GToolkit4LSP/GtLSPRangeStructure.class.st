Class {
	#name : #GtLSPRangeStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPRangeStructure >> create [
	data at: 'start' put: GtLSPPositionStructure create  asDictionary.
	data at: 'end' put: GtLSPPositionStructure create  asDictionary
]

{ #category : #accessing }
GtLSPRangeStructure >> end [
	"The range's end position."

	^ (data at: 'end') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPRangeStructure >> end: anObject [
	data at: 'end' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRangeStructure >> start [
	"The range's start position."

	^ (data at: 'start') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPRangeStructure >> start: anObject [
	data at: 'start' put:  (self objectFor: anObject)
]
