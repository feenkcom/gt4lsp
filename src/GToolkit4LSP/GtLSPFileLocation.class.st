Class {
	#name : #GtLSPFileLocation,
	#superclass : #GtLSPModel,
	#instVars : [
		'lspFile',
		'start',
		'end'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #comparing }
GtLSPFileLocation >> = anObject [
	^ super = anObject and: [ start = anObject start and: [ end = anObject end ] ]
]

{ #category : #accessing }
GtLSPFileLocation >> editor [
	| editor |
	editor := lspFile editor.
	editor
		enqueueTask: [ | startIndex endIndex |
			startIndex := self startIndexIn: editor.
			endIndex := self endIndexIn: editor.
			editor editor
				moveCursorTo: startIndex;
				select: startIndex to: endIndex.
			editor
				scrollToPosition: (editor text asString lineNumberCorrespondingToIndex: startIndex + 1) ]
				asBlTask.
	^ editor
]

{ #category : #accessing }
GtLSPFileLocation >> end [
	^ end
]

{ #category : #accessing }
GtLSPFileLocation >> end: anIntegerOrPosition [
	end := anIntegerOrPosition
]

{ #category : #private }
GtLSPFileLocation >> endIndexIn: editor [
	^ end isInteger
		ifTrue: [ end ]
		ifFalse: [ editor editor indexForPosition: end ]
]

{ #category : #accessing }
GtLSPFileLocation >> endPosition [
	^ end
]

{ #category : #accessing }
GtLSPFileLocation >> endPosition: anObject [
	self end: anObject
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
	start isInteger
		ifTrue: [ | line |
			line := 0.
			self lspFile source
				lineIndicesDo: [ :s :e :wEol | 
					line := line + 1.
					(start between: s and: wEol)
						ifTrue: [ ^ '(L' , line printString , ':C' , (start - s + 1) printString , ')' ] ].
			^ '(' , start printString , ')' ].
	^ '(L' , (start line + 1) printString , ':C'
		, (start character + 1) printString , ')'
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
GtLSPFileLocation >> start [
	^ start
]

{ #category : #accessing }
GtLSPFileLocation >> start: anIntegerOrPosition [
	start := anIntegerOrPosition
]

{ #category : #private }
GtLSPFileLocation >> startIndexIn: editor [
	^ start isInteger
		ifTrue: [ start - 1 ]
		ifFalse: [ editor editor indexForPosition: start ]
]

{ #category : #accessing }
GtLSPFileLocation >> startPosition [
	^ self start
]

{ #category : #accessing }
GtLSPFileLocation >> startPosition: anObject [
	self start: anObject
]
