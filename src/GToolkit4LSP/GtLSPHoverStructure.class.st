Class {
	#name : #GtLSPHoverStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPHoverStructure >> contents [
	"The hover's content"

	^ data at: 'contents'
]

{ #category : #accessing }
GtLSPHoverStructure >> contents: anObject [
	data at: 'contents' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPHoverStructure >> range [
	"An optional range inside the text document that is used to
visualize the hover, e.g. by changing the background color."

	^ (data at: 'range' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPRangeStructure on: obj ]
]

{ #category : #accessing }
GtLSPHoverStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]
