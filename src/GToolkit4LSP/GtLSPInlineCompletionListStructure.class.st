Class {
	#name : #GtLSPInlineCompletionListStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPInlineCompletionListStructure >> create [
	data at: 'items' put: #()
]

{ #category : #accessing }
GtLSPInlineCompletionListStructure >> items [
	"The inline completion items"

	^ data at: 'items'
]

{ #category : #accessing }
GtLSPInlineCompletionListStructure >> items: anObject [
	data at: 'items' put:  (self objectFor: anObject)
]
