Class {
	#name : #GtLSPWorkDoneProgressEndStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkDoneProgressEndStructure >> kind [
	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPWorkDoneProgressEndStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkDoneProgressEndStructure >> message [
	"Optional, a final message indicating to for example indicate the outcome
of the operation."

	^ data at: 'message'
]

{ #category : #accessing }
GtLSPWorkDoneProgressEndStructure >> message: anObject [
	data at: 'message' put:  (self objectFor: anObject)
]
