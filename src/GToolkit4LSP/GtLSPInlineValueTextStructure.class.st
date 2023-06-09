Class {
	#name : #GtLSPInlineValueTextStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPInlineValueTextStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPInlineValueTextStructure >> range [
	"The document range for which the inline value applies."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineValueTextStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineValueTextStructure >> text [
	"The text of the inline value."

	^ data at: 'text'
]

{ #category : #accessing }
GtLSPInlineValueTextStructure >> text: anObject [
	data at: 'text' put:  (self objectFor: anObject)
]
