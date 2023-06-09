Class {
	#name : #GtLSPSemanticTokensLegendStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSemanticTokensLegendStructure >> create [
	data at: 'tokenTypes' put: #().
	data at: 'tokenModifiers' put: #()
]

{ #category : #accessing }
GtLSPSemanticTokensLegendStructure >> tokenModifiers [
	"The token modifiers a server uses."

	^ data at: 'tokenModifiers'
]

{ #category : #accessing }
GtLSPSemanticTokensLegendStructure >> tokenModifiers: anObject [
	data at: 'tokenModifiers' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensLegendStructure >> tokenTypes [
	"The token types a server uses."

	^ data at: 'tokenTypes'
]

{ #category : #accessing }
GtLSPSemanticTokensLegendStructure >> tokenTypes: anObject [
	data at: 'tokenTypes' put:  (self objectFor: anObject)
]
