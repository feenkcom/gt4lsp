Class {
	#name : #GtLSPSemanticTokensPartialResultStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSemanticTokensPartialResultStructure >> create [
	data at: 'data' put: #()
]

{ #category : #accessing }
GtLSPSemanticTokensPartialResultStructure >> data [
	^ data at: 'data'
]

{ #category : #accessing }
GtLSPSemanticTokensPartialResultStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]
