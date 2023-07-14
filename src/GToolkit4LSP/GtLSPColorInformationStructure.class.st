Class {
	#name : #GtLSPColorInformationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPColorInformationStructure >> color [
	"The actual color value for this color range."

	^ (data at: 'color') ifNotNil: [ :obj | GtLSPColorStructure on: obj ]
]

{ #category : #accessing }
GtLSPColorInformationStructure >> color: anObject [
	data at: 'color' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPColorInformationStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary.
	data at: 'color' put: GtLSPColorStructure create  asDictionary
]

{ #category : #accessing }
GtLSPColorInformationStructure >> range [
	"The range in the document where this color appears."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure on: obj ]
]

{ #category : #accessing }
GtLSPColorInformationStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]
