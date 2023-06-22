Class {
	#name : #GtLSPFileSourceChanged,
	#superclass : #Announcement,
	#instVars : [
		'lspFile',
		'oldSource'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPFileSourceChanged >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPFileSourceChanged >> lspFile: anObject [
	lspFile := anObject
]

{ #category : #accessing }
GtLSPFileSourceChanged >> oldSource [
	^ oldSource
]

{ #category : #accessing }
GtLSPFileSourceChanged >> oldSource: anObject [
	oldSource := anObject
]
