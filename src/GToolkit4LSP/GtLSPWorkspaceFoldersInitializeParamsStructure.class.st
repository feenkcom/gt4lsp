Class {
	#name : #GtLSPWorkspaceFoldersInitializeParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceFoldersInitializeParamsStructure >> workspaceFolders [
	"The workspace folders configured in the client when the server starts.

This property is only available if the client supports workspace folders.
It can be `null` if the client supports workspace folders but none are
configured.

@since 3.6.0"

	^ data at: 'workspaceFolders'
]

{ #category : #accessing }
GtLSPWorkspaceFoldersInitializeParamsStructure >> workspaceFolders: anObject [
	data at: 'workspaceFolders' put:  (self objectFor: anObject)
]
