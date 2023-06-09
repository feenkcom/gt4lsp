Class {
	#name : #GtLSPFileRenameStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFileRenameStructure >> newUri [
	"A file:// URI for the new location of the file/folder being renamed."

	^ data at: 'newUri'
]

{ #category : #accessing }
GtLSPFileRenameStructure >> newUri: anObject [
	data at: 'newUri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileRenameStructure >> oldUri [
	"A file:// URI for the original location of the file/folder being renamed."

	^ data at: 'oldUri'
]

{ #category : #accessing }
GtLSPFileRenameStructure >> oldUri: anObject [
	data at: 'oldUri' put:  (self objectFor: anObject)
]
