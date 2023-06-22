Class {
	#name : #GtLSPFileAdded,
	#superclass : #Announcement,
	#instVars : [
		'lspFile'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPFileAdded >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPFileAdded >> lspFile: anObject [
	lspFile := anObject
]
