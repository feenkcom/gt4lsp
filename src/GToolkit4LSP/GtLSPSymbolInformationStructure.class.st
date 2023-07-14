Class {
	#name : #GtLSPSymbolInformationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSymbolInformationStructure >> containerName [
	"The name of the symbol containing this symbol. This information is for
user interface purposes (e.g. to render a qualifier in the user interface
if necessary). It can't be used to re-infer a hierarchy for the document
symbols."

	^ data at: 'containerName' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> containerName: anObject [
	data at: 'containerName' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPSymbolInformationStructure >> create [
	data at: 'location' put: GtLSPLocationStructure create  asDictionary
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> deprecated [
	"Indicates if this symbol is deprecated.

@deprecated Use tags instead"

	^ data at: 'deprecated' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> deprecated: anObject [
	data at: 'deprecated' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> kind [
	"The kind of this symbol."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
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

	^ (data at: 'location') ifNotNil: [ :obj | GtLSPLocationStructure on: obj ]
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> location: anObject [
	data at: 'location' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> name [
	"The name of this symbol."

	^ data at: 'name'
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> name: anObject [
	data at: 'name' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> tags [
	"Tags for this symbol.

@since 3.16.0"

	^ data at: 'tags' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSymbolInformationStructure >> tags: anObject [
	data at: 'tags' put:  (self objectFor: anObject)
]
