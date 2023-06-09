Class {
	#name : #GtLSPFileDeleteStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFileDeleteStructure >> uri [
	"A file:// URI for the location of the file/folder being deleted."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPFileDeleteStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
