Class {
	#name : #GtLSPTextEditStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPTextEditStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPTextEditStructure >> newText [
	"The string to be inserted. For delete operations use an
empty string."

	^ data at: 'newText'
]

{ #category : #accessing }
GtLSPTextEditStructure >> newText: anObject [
	data at: 'newText' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextEditStructure >> range [
	"The range of the text document to be manipulated. To insert
text into a document create a range where start === end."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextEditStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]
