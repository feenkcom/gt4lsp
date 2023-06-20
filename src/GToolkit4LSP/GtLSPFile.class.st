Class {
	#name : #GtLSPFile,
	#superclass : #Object,
	#instVars : [
		'filename',
		'version'
	],
	#category : #'GToolkit4LSP-Client'
}

{ #category : #accessing }
GtLSPFile >> filename [
	^ filename
]

{ #category : #accessing }
GtLSPFile >> filename: aFilename [
	filename := aFilename asFileReference
]

{ #category : #accessing }
GtLSPFile >> initialize [
	super initialize.
	version := 0
]

{ #category : #accessing }
GtLSPFile >> nextVersion [
	^ version := version + 1
]

{ #category : #accessing }
GtLSPFile >> uri [
	^ filename asUrl printString
]

{ #category : #accessing }
GtLSPFile >> version [
	^ version
]

{ #category : #accessing }
GtLSPFile >> version: anInteger [
	version := anInteger
]
