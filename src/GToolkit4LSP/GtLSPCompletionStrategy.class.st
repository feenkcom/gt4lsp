Class {
	#name : #GtLSPCompletionStrategy,
	#superclass : #GtCompletionStrategy,
	#instVars : [
		'editorModel',
		'lspFile'
	],
	#category : #'GToolkit4LSP-Completion'
}

{ #category : #accessing }
GtLSPCompletionStrategy >> actionForTextEdit: textEdit [
	| start insert end text range |
	text := textEdit at: 'newText'.
	range := textEdit at: 'range'.
	start := (editorModel indexForPosition: (range at: 'start')) + 1.
	end := editorModel indexForPosition: (range at: 'end').
	insert := GtInsertTextCompletionAction
			labeled: text asRopedText glamorousCodeFontAndSize
			completion: text
			position: start - 1
			from: start.
	^ start > end
		ifTrue: [ insert ]
		ifFalse: [ (GtCompositeCompletionAction
				labeled: text asRopedText glamorousCodeFontAndSize)
				addAction: (GtDeleteTextCompletionAction
						labeled: ''
						from: start
						to: end);
				addAction: insert;
				yourself ]
]

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
	| textToDelete sortIndex textEdit additionalEdits action start end range newText additionalEditActions offset index compositeAction |
	textEdit := anItem at: 'textEdit'.
	additionalEdits := (anItem at: 'additionalTextEdits' ifAbsent: [ #() ])
			asSortedCollection: [ :a :b | self isEdit: b before: a ].
	additionalEditActions := additionalEdits
			collect: [ :each | self actionForTextEdit: each ].
	offset := 0.
	index := additionalEdits size.
	[ index > 0 and: [ self isEdit: (additionalEdits at: index) before: textEdit ] ]
		whileTrue: [ offset := offset + (self offsetForEdit: (additionalEdits at: index)).
			index := index - 1 ].
	action := self actionForTextEdit: textEdit.
	range := textEdit at: 'range'.
	start := (editorModel indexForPosition: (range at: 'start')) + 1.
	end := editorModel indexForPosition: (range at: 'end').
	textToDelete := (aText from: start to: end) asString.
	newText := textEdit at: 'newText'.
	sortIndex := (textToDelete isEmpty or: [ newText beginsWith: textToDelete ])
			ifTrue: [ 0 ]
			ifFalse: [ (newText beginsWith: textToDelete caseSensitive: false)
					ifTrue: [ 1 ]
					ifFalse: [ (newText
							findString: textToDelete
							startingAt: 1
							caseSensitive: false) > 0 ifTrue: [ 2 ] ifFalse: [ 3 ] ] ].
	additionalEditActions notEmpty
		ifTrue: [ action translateBy: offset.
			compositeAction := GtCompositeCompletionAction
					labeled: action label asRopedText glamorousCodeFontAndSize.
			additionalEditActions do: [ :each | compositeAction addAction: each ].
			compositeAction addAction: action.
			action := compositeAction ].
	^ action -> sortIndex
]

{ #category : #accessing }
GtLSPCompletionStrategy >> completionResultFor: aText at: anInteger requested: aBoolean [
	| stream |
	lspFile ifNil: [ ^ GtCompletionResult empty ].
	stream := GtLSPCompletionStream new.
	self lspClient
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
GtLSPCompletionStrategy >> isEdit: aTextEdit before: bTextEdit [
	| aRange bRange aPos bPos aLine bLine |
	aRange := aTextEdit at: 'range'.
	bRange := bTextEdit at: 'range'.
	aPos := aRange at: 'start'.
	bPos := bRange at: 'start'.
	aLine := aPos at: 'line'.
	bLine := bPos at: 'line'.
	aLine < bLine ifTrue: [ ^ true ].
	bLine > aLine ifTrue: [ ^ false ].
	^ (aPos at: 'character') <= (bPos at: 'character')
]

{ #category : #accessing }
GtLSPCompletionStrategy >> lspClient [
	^ lspFile ifNotNil: [ lspFile lspClient ]
]

{ #category : #accessing }
GtLSPCompletionStrategy >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPCompletionStrategy >> lspFile: anObject [
	lspFile := anObject
]

{ #category : #accessing }
GtLSPCompletionStrategy >> offsetForEdit: textEdit [
	| range start end |
	range := textEdit at: 'range'.
	start := editorModel indexForPosition: (range at: 'start').
	end := editorModel indexForPosition: (range at: 'end').
	^ (textEdit at: 'newText') size - (end - start)
]
