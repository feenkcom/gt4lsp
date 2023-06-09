Class {
	#name : #GtLSPStringValueStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPStringValueStructure >> kind [
	"The kind of string value."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPStringValueStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPStringValueStructure >> value [
	"The snippet string."

	^ data at: 'value'
]

{ #category : #accessing }
GtLSPStringValueStructure >> value: anObject [
	data at: 'value' put:  (self objectFor: anObject)
]
