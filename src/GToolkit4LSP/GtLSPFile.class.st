Class {
	#name : #GtLSPFile,
	#superclass : #Object,
	#instVars : [
		'filename',
		'version',
		'contents'
	],
	#category : #'GToolkit4LSP-Client'
}

{ #category : #accessing }
GtLSPFile >> contents [
	^ contents
]

{ #category : #accessing }
GtLSPFile >> contents: aString [
	contents := aString
]

{ #category : #accessing }
GtLSPFile >> endPositionFor: anInteger [
	| position |
	position := self positionFor: anInteger.
	position character: position character + 1.
	^ position
]

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
GtLSPFile >> positionFor: anInteger [
	| line column i position char |
	line := 0.
	column := 0.
	i := 1.
	position := anInteger min: contents size.
	[ i < position ]
		whileTrue: [ i := i + 1.
			char := contents at: i.
			char = Character cr
				ifTrue: [ line := line + 1.
					column := 0.
					(i + 1 < position and: [ (contents at: i) = Character lf ])
						ifTrue: [ i := i + 1 ] ]
				ifFalse: [ char = Character lf
						ifTrue: [ line := line + 1.
							column := 0 ]
						ifFalse: [ column := column + 1 ] ] ].
	^ GtLSPPositionStructure create
		character: column;
		line: line;
		yourself
]

{ #category : #accessing }
GtLSPFile >> startPositionFor: anInteger [
	^ self positionFor: anInteger
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
