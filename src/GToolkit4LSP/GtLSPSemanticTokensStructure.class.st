Class {
	#name : #GtLSPSemanticTokensStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSemanticTokensStructure >> create [
	data at: 'data' put: #()
]

{ #category : #accessing }
GtLSPSemanticTokensStructure >> data [
	"The actual tokens."

	^ data at: 'data'
]

{ #category : #accessing }
GtLSPSemanticTokensStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensStructure >> resultId [
	"An optional result id. If provided and clients support delta updating
the client will include the result id in the next semantic token request.
A server can then instead of computing all semantic tokens again simply
send a delta."

	^ data at: 'resultId' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensStructure >> resultId: anObject [
	data at: 'resultId' put:  (self objectFor: anObject)
]
