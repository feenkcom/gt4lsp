Class {
	#name : #GtLSPLocationLinkStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPLocationLinkStructure >> create [
	data at: 'targetRange' put: GtLSPRangeStructure create  asDictionary.
	data at: 'targetSelectionRange' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPLocationLinkStructure >> originSelectionRange [
	"Span of the origin of this link.

Used as the underlined span for mouse interaction. Defaults to the word range at
the definition position."

	^ (data at: 'originSelectionRange') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPLocationLinkStructure >> originSelectionRange: anObject [
	data at: 'originSelectionRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPLocationLinkStructure >> targetRange [
	"The full target range of this link. If the target for example is a symbol then target range is the
range enclosing this symbol not including leading/trailing whitespace but everything else
like comments. This information is typically used to highlight the range in the editor."

	^ (data at: 'targetRange') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPLocationLinkStructure >> targetRange: anObject [
	data at: 'targetRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPLocationLinkStructure >> targetSelectionRange [
	"The range that should be selected and revealed when this link is being followed, e.g the name of a function.
Must be contained by the `targetRange`. See also `DocumentSymbol#range`"

	^ (data at: 'targetSelectionRange') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPLocationLinkStructure >> targetSelectionRange: anObject [
	data at: 'targetSelectionRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPLocationLinkStructure >> targetUri [
	"The target resource identifier of this link."

	^ data at: 'targetUri'
]

{ #category : #accessing }
GtLSPLocationLinkStructure >> targetUri: anObject [
	data at: 'targetUri' put:  (self objectFor: anObject)
]
