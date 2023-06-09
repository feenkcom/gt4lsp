Class {
	#name : #GtLSPFileOperationRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPFileOperationRegistrationOptionsStructure >> create [
	data at: 'filters' put: #()
]

{ #category : #accessing }
GtLSPFileOperationRegistrationOptionsStructure >> filters [
	"The actual filters."

	^ data at: 'filters'
]

{ #category : #accessing }
GtLSPFileOperationRegistrationOptionsStructure >> filters: anObject [
	data at: 'filters' put:  (self objectFor: anObject)
]
