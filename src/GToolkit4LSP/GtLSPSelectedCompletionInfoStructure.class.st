Class {
	#name : #GtLSPSelectedCompletionInfoStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSelectedCompletionInfoStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPSelectedCompletionInfoStructure >> range [
	"The range that will be replaced if this completion item is accepted."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSelectedCompletionInfoStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSelectedCompletionInfoStructure >> text [
	"The text the range will be replaced with if this completion is accepted."

	^ data at: 'text'
]

{ #category : #accessing }
GtLSPSelectedCompletionInfoStructure >> text: anObject [
	data at: 'text' put:  (self objectFor: anObject)
]
