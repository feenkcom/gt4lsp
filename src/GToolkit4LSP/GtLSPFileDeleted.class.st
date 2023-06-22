Class {
	#name : #GtLSPFileDeleted,
	#superclass : #Announcement,
	#instVars : [
		'lspFile'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPFileDeleted >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPFileDeleted >> lspFile: anObject [
	lspFile := anObject
]
