Class {
	#name : #GtLSPSymbolInformationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSymbolInformationStructure >> create [
	data at: 'location' put: GtLSPLocationStructure create  asDictionary
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> deprecated [
	"Indicates if this symbol is deprecated.

@deprecated Use tags instead"

	^ data at: 'deprecated'
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> deprecated: anObject [
	data at: 'deprecated' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> location [
	"The location of this symbol. The location's range is used by a tool
to reveal the location in the editor. If the symbol is selected in the
tool the range's start information is used to position the cursor. So
the range usually spans more than the actual symbol's name and does
normally include things like visibility modifiers.

The range doesn't have to denote a node range in the sense of an abstract
syntax tree. It can therefore not be used to re-construct a hierarchy of
the symbols."

	^ (data at: 'location') ifNotNil: [ :obj | GtLSPLocationStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> location: anObject [
	data at: 'location' put:  (self objectFor: anObject)
]
