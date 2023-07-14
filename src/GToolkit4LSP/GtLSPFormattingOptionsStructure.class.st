Class {
	#name : #GtLSPFormattingOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> insertFinalNewline [
	"Insert a newline character at the end of the file if one does not exist.

@since 3.15.0"

	^ data at: 'insertFinalNewline' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> insertFinalNewline: anObject [
	data at: 'insertFinalNewline' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> insertSpaces [
	"Prefer spaces over tabs."

	^ data at: 'insertSpaces'
]

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> insertSpaces: anObject [
	data at: 'insertSpaces' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> tabSize [
	"Size of a tab in spaces."

	^ data at: 'tabSize'
]

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> tabSize: anObject [
	data at: 'tabSize' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> trimFinalNewlines [
	"Trim all newlines after the final newline at the end of the file.

@since 3.15.0"

	^ data at: 'trimFinalNewlines' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> trimFinalNewlines: anObject [
	data at: 'trimFinalNewlines' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> trimTrailingWhitespace [
	"Trim trailing whitespace on a line.

@since 3.15.0"

	^ data at: 'trimTrailingWhitespace' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFormattingOptionsStructure >> trimTrailingWhitespace: anObject [
	data at: 'trimTrailingWhitespace' put:  (self objectFor: anObject)
]
