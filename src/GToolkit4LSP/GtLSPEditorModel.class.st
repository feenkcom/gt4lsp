Class {
	#name : #GtLSPEditorModel,
	#superclass : #BrTextEditorModel,
	#instVars : [
		'encoder',
		'defaultByteSize'
	],
	#category : #'GToolkit4LSP-Editor'
}

{ #category : #accessing }
GtLSPEditorModel >> characterSizeOf: aCharacter [
	^ (encoder encodedByteCountFor: aCharacter) // defaultByteSize
]

{ #category : #accessing }
GtLSPEditorModel >> endPositionFrom: position deleting: value [
	| result stream char lf cr |
	result := GtLSPPositionStructure create.
	result line: position line.
	result character: position character.
	stream := value asString readStream.
	lf := Character lf.
	cr := Character cr.
	[ stream atEnd ]
		whileFalse: [ char := stream next.
			char = cr
				ifTrue: [ stream peekFor: lf.
					result line: result line + 1.
					result character: 0 ]
				ifFalse: [ char = lf
						ifTrue: [ result line: result line + 1.
							result character: 0 ]
						ifFalse: [ result
								character: result character + (self characterSizeOf: char) ] ] ].
	^ result
]

{ #category : #accessing }
GtLSPEditorModel >> indexForPosition: aDictionary [
	| character segment index i char |
	character := (aDictionary at: 'character') + 1.
	segment := segmentCollector cachedAt: (aDictionary at: 'line') + 1.
	index := segment textStart.
	i := 1.
	[ i < character ]
		whileTrue: [ char := segment text at: i.
			index := index + 1.
			i := i + (self characterSizeOf: char) ].
	^ index
]

{ #category : #accessing }
GtLSPEditorModel >> initialize [
	super initialize.
	encoder := ZnUTF16Encoder new.
	defaultByteSize := 2
]

{ #category : #accessing }
GtLSPEditorModel >> onStringsInserted: aBlTextStringsInserted [
	| events |
	events := (aBlTextStringsInserted requestedIndices
			with: aBlTextStringsInserted strings
			collect: [ :index :string | 
				| position |
				position := self positionFor: index.
				Dictionary new
					at: 'text' put: string;
					at: 'range'
						put: (GtLSPRangeStructure create
								start: position;
								end: position;
								yourself) asDictionary;
					yourself ]) reversed.
	self dispatchEvent: (GtLSPTextDocumentContentChange new events: events).
	super onStringsInserted: aBlTextStringsInserted
]

{ #category : #accessing }
GtLSPEditorModel >> onTextsDeleted: aBlTextsDeleted [
	| events |
	aBlTextsDeleted requestedIntervals size > 1
		ifTrue: [ events := {Dictionary new at: 'text' put: text asString} ]
		ifFalse: [ events := (aBlTextsDeleted requestedIntervals
					with: aBlTextsDeleted texts
					collect: [ :interval :value | 
						| position |
						position := self positionFor: interval first - 1.
						Dictionary new
							at: 'text' put: '';
							at: 'range'
								put: (GtLSPRangeStructure create
										start: position;
										end: (self endPositionFrom: position deleting: value);
										yourself) asDictionary;
							yourself ]) reversed ].
	self dispatchEvent: (GtLSPTextDocumentContentChange new events: events).
	super onTextsDeleted: aBlTextsDeleted
]

{ #category : #accessing }
GtLSPEditorModel >> positionFor: anInteger [
	| line character |
	line := segmentCollector cachedSegmentIndexAt: anInteger.
	character := 0.
	(segmentCollector cachedAt: line) textStart + 1
		to: (anInteger min: text size)
		do: [ :i | character := character + (self characterSizeOf: (text at: i)) ].
	^ GtLSPPositionStructure create
		line: line - 1;
		character: character;
		yourself
]
