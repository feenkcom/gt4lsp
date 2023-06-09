Class {
	#name : #GtLSPSemanticTokensDeltaPartialResultStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSemanticTokensDeltaPartialResultStructure >> create [
	data at: 'edits' put: #()
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaPartialResultStructure >> edits [
	^ data at: 'edits'
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaPartialResultStructure >> edits: anObject [
	data at: 'edits' put:  (self objectFor: anObject)
]
