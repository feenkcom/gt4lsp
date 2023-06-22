Extension { #name : #AbstractFileReference }

{ #category : #'*GToolkit4LSP' }
AbstractFileReference >> gtMatches: aPattern [
	| basename |
	basename := self basename.
	^ (aPattern findTokens: ';' , String crlf)
		anySatisfy: [ :each | each match: basename ]
]
