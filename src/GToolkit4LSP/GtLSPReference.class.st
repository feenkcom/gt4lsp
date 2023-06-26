Class {
	#name : #GtLSPReference,
	#superclass : #GtLSPModel,
	#instVars : [
		'lspFile',
		'startPosition',
		'endPosition'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #comparing }
GtLSPReference >> = anObject [
	^ super = anObject
		and: [ startPosition = anObject startPosition
				and: [ endPosition = anObject endPosition ] ]
]

{ #category : #accessing }
GtLSPReference >> editor [
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
GtLSPReference >> endPosition [
	^ endPosition
]

{ #category : #accessing }
GtLSPReference >> endPosition: anObject [
	endPosition := anObject
]

{ #category : #accessing }
GtLSPReference >> filename [
	^ lspFile filename
]

{ #category : #testing }
GtLSPReference >> isLSPReference [
	^ true
]

{ #category : #accessing }
GtLSPReference >> lspClient [
	^ lspFile lspClient
]

{ #category : #accessing }
GtLSPReference >> lspDirectory [
	^ lspFile lspDirectory
]

{ #category : #accessing }
GtLSPReference >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPReference >> lspFile: anObject [
	lspFile := anObject
]

{ #category : #accessing }
GtLSPReference >> printOn: aStream [
	aStream << lspFile gtDisplayString << ' (L'
		<< (startPosition line + 1) printString << ':C'
		<< (startPosition character + 1) printString << ')'
]

{ #category : #accessing }
GtLSPReference >> startPosition [
	^ startPosition
]

{ #category : #accessing }
GtLSPReference >> startPosition: anObject [
	startPosition := anObject
]
