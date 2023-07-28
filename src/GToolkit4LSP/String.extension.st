Extension { #name : #String }

{ #category : #'*GToolkit4LSP' }
String >> gtLSPIntervalForRange: aRange [
	| start end line sCol eCol encoder first last size |
	encoder := ZnUTF16Encoder new.
	start := aRange at: 'start'.
	end := aRange at: 'end'.
	line := (start at: 'line') + 1.
	sCol := start at: 'character'.
	eCol := end at: 'character'.
	first := (self intervalOfLine: line) first.
	[ sCol > 0 and: [ first <= self size ] ]
		whileTrue: [ size := (encoder encodedByteCountFor: (self at: first)) // 2.
			sCol := sCol - size.
			eCol := eCol - size.
			first := first + 1 ].
	last := first.
	[ eCol > 0 and: [ last <= self size ] ]
		whileTrue: [ size := (encoder encodedByteCountFor: (self at: last)) // 2.
			eCol := eCol - size.
			last := last + 1 ].
	^ first to: last - 1
]
