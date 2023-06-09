Class {
	#name : #GtLSPPositionStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPPositionStructure >> character [
	"Character offset on a line in a document (zero-based).

The meaning of this offset is determined by the negotiated
`PositionEncodingKind`.

If the character value is greater than the line length it defaults back to the
line length."

	^ data at: 'character'
]

{ #category : #accessing }
GtLSPPositionStructure >> character: anObject [
	data at: 'character' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPositionStructure >> line [
	"Line position in a document (zero-based).

If a line number is greater than the number of lines in a document, it defaults back to the number of lines in the document.
If a line number is negative, it defaults to 0."

	^ data at: 'line'
]

{ #category : #accessing }
GtLSPPositionStructure >> line: anObject [
	data at: 'line' put:  (self objectFor: anObject)
]
