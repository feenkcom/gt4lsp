Class {
	#name : #GtLSPDeleteFilesParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDeleteFilesParamsStructure >> create [
	data at: 'files' put: #()
]

{ #category : #accessing }
GtLSPDeleteFilesParamsStructure >> files [
	"An array of all files/folders deleted in this operation."

	^ data at: 'files'
]

{ #category : #accessing }
GtLSPDeleteFilesParamsStructure >> files: anObject [
	data at: 'files' put:  (self objectFor: anObject)
]
