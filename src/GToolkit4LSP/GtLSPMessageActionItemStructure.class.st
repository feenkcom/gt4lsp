Class {
	#name : #GtLSPMessageActionItemStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPMessageActionItemStructure >> title [
	"A short title like 'Retry', 'Open Log' etc."

	^ data at: 'title'
]

{ #category : #accessing }
GtLSPMessageActionItemStructure >> title: anObject [
	data at: 'title' put:  (self objectFor: anObject)
]
