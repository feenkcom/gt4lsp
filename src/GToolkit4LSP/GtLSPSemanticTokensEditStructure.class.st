Class {
	#name : #GtLSPSemanticTokensEditStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSemanticTokensEditStructure >> data [
	"The elements to insert."

	^ data at: 'data' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensEditStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensEditStructure >> deleteCount [
	"The count of elements to remove."

	^ data at: 'deleteCount'
]

{ #category : #accessing }
GtLSPSemanticTokensEditStructure >> deleteCount: anObject [
	data at: 'deleteCount' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensEditStructure >> start [
	"The start offset of the edit."

	^ data at: 'start'
]

{ #category : #accessing }
GtLSPSemanticTokensEditStructure >> start: anObject [
	data at: 'start' put:  (self objectFor: anObject)
]
