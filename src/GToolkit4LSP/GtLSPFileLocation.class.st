Class {
	#name : #GtLSPFileLocation,
	#superclass : #GtLSPModel,
	#instVars : [
		'lspFile',
		'startPosition',
		'endPosition'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #comparing }
GtLSPFileLocation >> = anObject [
	^ super = anObject
		and: [ startPosition = anObject startPosition
				and: [ endPosition = anObject endPosition ] ]
]

{ #category : #accessing }
GtLSPFileLocation >> editor [
	| editor |
	editor := lspFile editor.
	editor
		enqueueTask: [ | start end |
			start := editor editor indexForPosition: startPosition.
			end := editor editor indexForPosition: endPosition.
			editor editor
				moveCursorTo: start;
				select: start to: end.
			editor
				scrollToPosition: (editor text asString lineNumberCorrespondingToIndex: start + 1) ]
				asBlTask.
	^ editor
]

{ #category : #accessing }
GtLSPFileLocation >> endPosition [
	^ endPosition
]

{ #category : #accessing }
GtLSPFileLocation >> endPosition: anObject [
	endPosition := anObject
]

{ #category : #accessing }
GtLSPFileLocation >> filename [
	^ lspFile filename
]

{ #category : #testing }
GtLSPFileLocation >> isLSPReference [
	^ true
]

{ #category : #accessing }
GtLSPFileLocation >> lspClient [
	^ lspFile lspClient
]

{ #category : #accessing }
GtLSPFileLocation >> lspDirectory [
	^ lspFile lspDirectory
]

{ #category : #accessing }
GtLSPFileLocation >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPFileLocation >> lspFile: anObject [
	lspFile := anObject
]

{ #category : #accessing }
GtLSPFileLocation >> positionString [
	^ '(L' , (startPosition line + 1) printString , ':C'
		, (startPosition character + 1) printString , ')'
]

{ #category : #printing }
GtLSPFileLocation >> printOn: aStream [
	aStream << lspFile gtDisplayString << ' ' << self positionString
]

{ #category : #accessing }
GtLSPFileLocation >> saveFile [
	self lspFile saveFile
]

{ #category : #accessing }
GtLSPFileLocation >> startPosition [
	^ startPosition
]

{ #category : #accessing }
GtLSPFileLocation >> startPosition: anObject [
	startPosition := anObject
]
