Class {
	#name : #GtLSPWorkDoneProgressCancelParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkDoneProgressCancelParamsStructure >> token [
	"The token to be used to report progress."

	^ data at: 'token'
]

{ #category : #accessing }
GtLSPWorkDoneProgressCancelParamsStructure >> token: anObject [
	data at: 'token' put:  (self objectFor: anObject)
]
