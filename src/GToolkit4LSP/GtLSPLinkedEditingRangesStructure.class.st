Class {
	#name : #GtLSPLinkedEditingRangesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPLinkedEditingRangesStructure >> create [
	data at: 'ranges' put: #()
]

{ #category : #accessing }
GtLSPLinkedEditingRangesStructure >> ranges [
	"A list of ranges that can be edited together. The ranges must have
identical length and contain identical text content. The ranges cannot overlap."

	^ data at: 'ranges'
]

{ #category : #accessing }
GtLSPLinkedEditingRangesStructure >> ranges: anObject [
	data at: 'ranges' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPLinkedEditingRangesStructure >> wordPattern [
	"An optional word pattern (regular expression) that describes valid contents for
the given ranges. If no pattern is provided, the client configuration's word
pattern will be used."

	^ data at: 'wordPattern'
]

{ #category : #accessing }
GtLSPLinkedEditingRangesStructure >> wordPattern: anObject [
	data at: 'wordPattern' put:  (self objectFor: anObject)
]
