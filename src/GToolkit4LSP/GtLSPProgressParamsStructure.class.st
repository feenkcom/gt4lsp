Class {
	#name : #GtLSPProgressParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPProgressParamsStructure >> token [
	"The progress token provided by the client or server."

	^ data at: 'token'
]

{ #category : #accessing }
GtLSPProgressParamsStructure >> token: anObject [
	data at: 'token' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPProgressParamsStructure >> value [
	"The progress data."

	^ data at: 'value'
]

{ #category : #accessing }
GtLSPProgressParamsStructure >> value: anObject [
	data at: 'value' put:  (self objectFor: anObject)
]
