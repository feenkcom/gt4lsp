Class {
	#name : #GtLSPWorkspaceFolderStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceFolderStructure >> name [
	"The name of the workspace folder. Used to refer to this
workspace folder in the user interface."

	^ data at: 'name'
]

{ #category : #accessing }
GtLSPWorkspaceFolderStructure >> name: anObject [
	data at: 'name' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceFolderStructure >> uri [
	"The associated URI for this workspace folder."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPWorkspaceFolderStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
