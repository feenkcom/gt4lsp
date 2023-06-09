Class {
	#name : #GtLSPRelativePatternStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRelativePatternStructure >> baseUri [
	"A workspace folder or a base URI to which this pattern will be matched
against relatively."

	^ data at: 'baseUri'
]

{ #category : #accessing }
GtLSPRelativePatternStructure >> baseUri: anObject [
	data at: 'baseUri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRelativePatternStructure >> pattern [
	"The actual glob pattern;"

	^ data at: 'pattern'
]

{ #category : #accessing }
GtLSPRelativePatternStructure >> pattern: anObject [
	data at: 'pattern' put:  (self objectFor: anObject)
]
