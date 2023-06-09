Class {
	#name : #GtLSPMarkupContentStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPMarkupContentStructure >> kind [
	"The type of the Markup"

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPMarkupContentStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPMarkupContentStructure >> value [
	"The content itself"

	^ data at: 'value'
]

{ #category : #accessing }
GtLSPMarkupContentStructure >> value: anObject [
	data at: 'value' put:  (self objectFor: anObject)
]
