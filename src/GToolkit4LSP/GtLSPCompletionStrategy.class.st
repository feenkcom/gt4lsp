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
GtLSPCompletionStrategy >> buildCompletionResultsFrom: aDictionary for: aText [
	| items |
	items := ((aDictionary at: 'items' ifAbsent: [ #() ])
			reject: [ :each | each at: 'deprecated' ifAbsent: [ false ] ])
			collect: [ :each | each at: 'textEdit' ].
	^ (((items
		collect: [ :each | 
			| start end text deleteAction insert textToDelete sortIndex |
			text := each at: 'newText'.
			start := (editorModel indexForPosition: ((each at: 'range') at: 'start')) + 1.
			end := editorModel indexForPosition: ((each at: 'range') at: 'end').
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
									caseSensitive: false) > 0 ifTrue: [ 2 ] ifFalse: [ nil ] ] ].
			((GtCompositeCompletionAction
				labeled: text asRopedText glamorousCodeFontAndSize)
				addAction: deleteAction;
				addAction: insert;
				yourself) -> sortIndex ]) reject: [ :each | each value isNil ])
		asSortedCollection: [ :a :b | a value < b value or: [ a value = b value and: [ a key label < b key label ] ] ])
		collect: #key
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
						ifNotNil: [ self buildCompletionResultsFrom: results for: aText ]) ].
	^ GtStreamedCompletionResult onStream: stream
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
