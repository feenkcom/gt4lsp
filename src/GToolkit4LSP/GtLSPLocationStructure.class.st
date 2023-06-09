Class {
	#name : #GtLSPLocationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPLocationStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPLocationStructure >> range [
	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPLocationStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPLocationStructure >> uri [
	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPLocationStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
