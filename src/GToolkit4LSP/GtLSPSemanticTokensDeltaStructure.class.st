Class {
	#name : #GtLSPSemanticTokensDeltaStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSemanticTokensDeltaStructure >> create [
	data at: 'edits' put: #()
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaStructure >> edits [
	"The semantic token edits to transform a previous result into a new result."

	^ data at: 'edits'
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaStructure >> edits: anObject [
	data at: 'edits' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaStructure >> resultId [
	^ data at: 'resultId'
]

{ #category : #accessing }
GtLSPSemanticTokensDeltaStructure >> resultId: anObject [
	data at: 'resultId' put:  (self objectFor: anObject)
]
