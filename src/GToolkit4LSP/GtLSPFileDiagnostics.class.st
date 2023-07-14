Class {
	#name : #GtLSPFileDiagnostics,
	#superclass : #Announcement,
	#instVars : [
		'lspFile'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPFileDiagnostics >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPFileDiagnostics >> lspFile: anObject [
	lspFile := anObject
]
