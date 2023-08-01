Class {
	#name : #GtLSPFileChange,
	#superclass : #RBRefactoryChange,
	#instVars : [
		'newSource',
		'lspFile'
	],
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #comparing }
GtLSPFileChange >> = anObject [
	^ self class = anObject class
		and: [ self lspFile == anObject lspFile and: [ self newSource = anObject newSource ] ]
]

{ #category : #accessing }
GtLSPFileChange >> executeNotifying: aBlock [
	| undo |
	undo := self copy.
	undo newSource: lspFile source.
	lspFile source: newSource.
	lspFile updateServerSource.
	aBlock value.
	^ undo
]

{ #category : #accessing }
GtLSPFileChange >> gtDiffChange [
	^ GtDiffBuilder
		computeDifferencesFrom: lspFile source
		to: newSource
		using: self lspDirectory diffSplitter
]

{ #category : #accessing }
GtLSPFileChange >> gtDiffStyler [
	^ self lspDirectory diffStyler
]

{ #category : #comparing }
GtLSPFileChange >> hash [
	^ self lspFile hash bitXor: self newSource hash
]

{ #category : #accessing }
GtLSPFileChange >> lspDirectory [
	^ self lspFile lspDirectory
]

{ #category : #accessing }
GtLSPFileChange >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPFileChange >> lspFile: anObject [
	lspFile := anObject
]

{ #category : #accessing }
GtLSPFileChange >> newSource [
	^ newSource
]

{ #category : #accessing }
GtLSPFileChange >> newSource: anObject [
	newSource := anObject
]
