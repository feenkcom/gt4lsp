Class {
	#name : #GtLSPCreateFilesParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPCreateFilesParamsStructure >> create [
	data at: 'files' put: #()
]

{ #category : #accessing }
GtLSPCreateFilesParamsStructure >> files [
	"An array of all files/folders created in this operation."

	^ data at: 'files'
]

{ #category : #accessing }
GtLSPCreateFilesParamsStructure >> files: anObject [
	data at: 'files' put:  (self objectFor: anObject)
]
