Class {
	#name : #GtLSPFoldingRangeStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFoldingRangeStructure >> collapsedText [
	"The text that the client should show when the specified range is
collapsed. If not defined or not supported by the client, a default
will be chosen by the client.

@since 3.17.0"

	^ data at: 'collapsedText'
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> collapsedText: anObject [
	data at: 'collapsedText' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> endCharacter [
	"The zero-based character offset before the folded range ends. If not defined, defaults to the length of the end line."

	^ data at: 'endCharacter'
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> endCharacter: anObject [
	data at: 'endCharacter' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> endLine [
	"The zero-based end line of the range to fold. The folded area ends with the line's last character.
To be valid, the end must be zero or larger and smaller than the number of lines in the document."

	^ data at: 'endLine'
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> endLine: anObject [
	data at: 'endLine' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> kind [
	"Describes the kind of the folding range such as `comment' or 'region'. The kind
is used to categorize folding ranges and used by commands like 'Fold all comments'.
See {@link FoldingRangeKind} for an enumeration of standardized kinds."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> startCharacter [
	"The zero-based character offset from where the folded range starts. If not defined, defaults to the length of the start line."

	^ data at: 'startCharacter'
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> startCharacter: anObject [
	data at: 'startCharacter' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> startLine [
	"The zero-based start line of the range to fold. The folded area starts after the line's last character.
To be valid, the end must be zero or larger and smaller than the number of lines in the document."

	^ data at: 'startLine'
]

{ #category : #accessing }
GtLSPFoldingRangeStructure >> startLine: anObject [
	data at: 'startLine' put:  (self objectFor: anObject)
]
