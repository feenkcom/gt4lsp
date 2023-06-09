Class {
	#name : #GtLSPFoldingRangeClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration for folding range
providers. If this is set to `true` the client supports the new
`FoldingRangeRegistrationOptions` return value for the corresponding
server capability as well."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> foldingRange [
	"Specific options for the folding range.

@since 3.17.0"

	^ data at: 'foldingRange'
]

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> foldingRange: anObject [
	data at: 'foldingRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> foldingRangeKind [
	"Specific options for the folding range kind.

@since 3.17.0"

	^ data at: 'foldingRangeKind'
]

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> foldingRangeKind: anObject [
	data at: 'foldingRangeKind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> lineFoldingOnly [
	"If set, the client signals that it only supports folding complete lines.
If set, client will ignore specified `startCharacter` and `endCharacter`
properties in a FoldingRange."

	^ data at: 'lineFoldingOnly'
]

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> lineFoldingOnly: anObject [
	data at: 'lineFoldingOnly' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> rangeLimit [
	"The maximum number of folding ranges that the client prefers to receive
per document. The value serves as a hint, servers are free to follow the
limit."

	^ data at: 'rangeLimit'
]

{ #category : #accessing }
GtLSPFoldingRangeClientCapabilitiesStructure >> rangeLimit: anObject [
	data at: 'rangeLimit' put:  (self objectFor: anObject)
]
