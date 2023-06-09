Class {
	#name : #GtLSPWorkspaceFoldersChangeEventStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceFoldersChangeEventStructure >> added [
	"The array of added workspace folders"

	^ data at: 'added'
]

{ #category : #accessing }
GtLSPWorkspaceFoldersChangeEventStructure >> added: anObject [
	data at: 'added' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPWorkspaceFoldersChangeEventStructure >> create [
	data at: 'added' put: #().
	data at: 'removed' put: #()
]

{ #category : #accessing }
GtLSPWorkspaceFoldersChangeEventStructure >> removed [
	"The array of the removed workspace folders"

	^ data at: 'removed'
]

{ #category : #accessing }
GtLSPWorkspaceFoldersChangeEventStructure >> removed: anObject [
	data at: 'removed' put:  (self objectFor: anObject)
]
