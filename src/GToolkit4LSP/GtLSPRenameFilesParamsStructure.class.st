Class {
	#name : #GtLSPRenameFilesParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPRenameFilesParamsStructure >> create [
	data at: 'files' put: #()
]

{ #category : #accessing }
GtLSPRenameFilesParamsStructure >> files [
	"An array of all files/folders renamed in this operation. When a folder is renamed, only
the folder will be included, and not its children."

	^ data at: 'files'
]

{ #category : #accessing }
GtLSPRenameFilesParamsStructure >> files: anObject [
	data at: 'files' put:  (self objectFor: anObject)
]
