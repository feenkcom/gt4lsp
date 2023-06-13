Class {
	#name : #GtLSPAnnotatedTextEditStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPAnnotatedTextEditStructure >> annotationId [
	"The actual identifier of the change annotation"

	^ data at: 'annotationId'
]

{ #category : #accessing }
GtLSPAnnotatedTextEditStructure >> annotationId: anObject [
	data at: 'annotationId' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPAnnotatedTextEditStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create asDictionary
]

{ #category : #accessing }
GtLSPAnnotatedTextEditStructure >> newText [
	"The string to be inserted. For delete operations use an
empty string."

	^ data at: 'newText'
]

{ #category : #accessing }
GtLSPAnnotatedTextEditStructure >> newText: anObject [
	data at: 'newText' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPAnnotatedTextEditStructure >> range [
	"The range of the text document to be manipulated. To insert
text into a document create a range where start === end."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPAnnotatedTextEditStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]
