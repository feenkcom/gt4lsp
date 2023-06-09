Class {
	#name : #GtLSPWorkDoneProgressCreateParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkDoneProgressCreateParamsStructure >> token [
	"The token to be used to report progress."

	^ data at: 'token'
]

{ #category : #accessing }
GtLSPWorkDoneProgressCreateParamsStructure >> token: anObject [
	data at: 'token' put:  (self objectFor: anObject)
]
