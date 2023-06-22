Class {
	#name : #GtLSPFileSaved,
	#superclass : #Announcement,
	#instVars : [
		'lspFile'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPFileSaved >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPFileSaved >> lspFile: anObject [
	lspFile := anObject
]
