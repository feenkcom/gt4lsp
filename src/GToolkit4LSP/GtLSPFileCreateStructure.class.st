Class {
	#name : #GtLSPFileCreateStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFileCreateStructure >> uri [
	"A file:// URI for the location of the file/folder being created."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPFileCreateStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
