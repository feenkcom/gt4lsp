Class {
	#name : #GtLSPCompletionStrategy,
	#superclass : #GtCompletionStrategy,
	#instVars : [
		'lspClient',
		'editorModel',
		'lspFile'
	],
	#category : #'GToolkit4LSP-Completion'
}

{ #category : #accessing }
GtLSPCompletionStrategy >> buildCompletionResult: anItem for: aText at: anInteger [
	(anItem includesKey: 'textEdit')
		ifTrue: [ ^ self
				buildTextEditCompletionResult: anItem
				for: aText
				at: anInteger ].
	(anItem includesKey: 'insertText')
		ifTrue: [ ^ self
				buildInsertTextCompletionResult: anItem
				for: aText
				at: anInteger ].
	^ self
		buildLabelCompletionResult: anItem
		for: aText
		at: anInteger
]

{ #category : #accessing }
GtLSPCompletionStrategy >> buildCompletionResultsFrom: aDictionary for: aText at: anInteger [
	| nonDeprecatedItems |
	nonDeprecatedItems := (aDictionary at: 'items' ifAbsent: [ #() ])
			reject: [ :each | each at: 'deprecated' ifAbsent: [ false ] ].
	nonDeprecatedItems isEmpty ifTrue: [ ^ #() ].
	^ (((nonDeprecatedItems
		collect: [ :each | 
			self
				buildCompletionResult: each
				for: aText
				at: anInteger ]) reject: #isNil)
		sort: [ :a :b | a value < b value or: [ a value = b value and: [ a key label < b key label ] ] ])
		collect: [ :each | each key ]
]

{ #category : #accessing }
GtLSPCompletionStrategy >> buildInsertTextCompletionResult: anItem for: aText at: anInteger [
	| text completionText insert |
	text := anItem at: 'insertText'.
	completionText := self
			completionTextFrom: text
			for: aText
			at: anInteger.
	insert := GtInsertTextCompletionAction
			labeled: text asRopedText glamorousCodeFontAndSize
			completion: completionText
			position: anInteger
			from: anInteger - text size + completionText size.
	^ insert -> 0
]

{ #category : #accessing }
GtLSPCompletionStrategy >> buildLabelCompletionResult: anItem for: aText at: anInteger [
	| start end text deleteAction insert textToDelete sortIndex char |
	text := anItem at: 'label'.
	start := anInteger.
	[ start > 0
		and: [ (char := aText at: start) isLetter
				or: [ char isDigit or: [ '-_' includes: char ] ] ] ]
		whileTrue: [ start := start - 1 ].
	start := start + 1.
	end := anInteger.
	textToDelete := (aText from: start to: end) asString.
	deleteAction := GtDeleteTextCompletionAction
			labeled: ''
			from: start
			to: end.
	insert := GtInsertTextCompletionAction
			labeled: text asRopedText glamorousCodeFontAndSize
			completion: text
			position: start - 1
			from: start.
	sortIndex := (textToDelete isEmpty or: [ text beginsWith: textToDelete ])
			ifTrue: [ 0 ]
			ifFalse: [ (text beginsWith: textToDelete caseSensitive: false)
					ifTrue: [ 1 ]
					ifFalse: [ (text
							findString: textToDelete
							startingAt: 1
							caseSensitive: false) > 0 ifTrue: [ 2 ] ifFalse: [ 3 ] ] ].
	^ ((GtCompositeCompletionAction
		labeled: text asRopedText glamorousCodeFontAndSize)
		addAction: deleteAction;
		addAction: insert;
		yourself) -> sortIndex
]

{ #category : #accessing }
GtLSPCompletionStrategy >> buildTextEditCompletionResult: anItem for: aText at: anInteger [
	| start end text deleteAction insert textToDelete sortIndex textEdit |
	textEdit := anItem at: 'textEdit'.
	text := textEdit at: 'newText'.
	start := (editorModel indexForPosition: ((textEdit at: 'range') at: 'start'))
			+ 1.
	end := editorModel indexForPosition: ((textEdit at: 'range') at: 'end').
	textToDelete := (aText from: start to: end) asString.
	deleteAction := GtDeleteTextCompletionAction
			labeled: ''
			from: start
			to: end.
	insert := GtInsertTextCompletionAction
			labeled: text asRopedText glamorousCodeFontAndSize
			completion: text
			position: start - 1
			from: start.
	sortIndex := (textToDelete isEmpty or: [ text beginsWith: textToDelete ])
			ifTrue: [ 0 ]
			ifFalse: [ (text beginsWith: textToDelete caseSensitive: false)
					ifTrue: [ 1 ]
					ifFalse: [ (text
							findString: textToDelete
							startingAt: 1
							caseSensitive: false) > 0 ifTrue: [ 2 ] ifFalse: [ 3 ] ] ].
	^ ((GtCompositeCompletionAction
		labeled: text asRopedText glamorousCodeFontAndSize)
		addAction: deleteAction;
		addAction: insert;
		yourself) -> sortIndex
]

{ #category : #accessing }
GtLSPCompletionStrategy >> completionResultFor: aText at: anInteger requested: aBoolean [
	| stream |
	(lspClient isNil or: [ lspFile isNil ]) ifTrue: [ ^ GtCompletionResult empty ].
	stream := GtLSPCompletionStream new.
	lspClient
		completeFile: lspFile filename
		at: (editorModel positionFor: anInteger)
		do: [ :results | 
			stream
				completionResults: (results
						ifNil: [ #() ]
						ifNotNil: [ [ self
								buildCompletionResultsFrom: results
								for: aText
								at: anInteger ] on: Error do: [ :ex | ex return: #() ] ]) ].
	^ GtStreamedCompletionResult onStream: stream
]

{ #category : #accessing }
GtLSPCompletionStrategy >> completionTextFrom: completionString for: aText at: anInteger [
	^ completionString
		allButFirst: ((completionString size to: 1 by: -1)
				detect: [ :i | 
					anInteger >= i
						and: [ (1 to: i)
								allSatisfy: [ :j | (completionString at: j) = (aText at: anInteger - i + j) ] ] ]
				ifNone: [ 0 ])
]

{ #category : #accessing }
GtLSPCompletionStrategy >> editorModel [
	^ editorModel
]

{ #category : #accessing }
GtLSPCompletionStrategy >> editorModel: anObject [
	editorModel := anObject
]

{ #category : #accessing }
GtLSPCompletionStrategy >> lspClient [
	^ lspClient
]

{ #category : #accessing }
GtLSPCompletionStrategy >> lspClient: anObject [
	lspClient := anObject
]

{ #category : #accessing }
GtLSPCompletionStrategy >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPCompletionStrategy >> lspFile: anObject [
	lspFile := anObject
]
