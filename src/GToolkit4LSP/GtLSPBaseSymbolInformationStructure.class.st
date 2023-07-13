Class {
	#name : #GtLSPBaseSymbolInformationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPBaseSymbolInformationStructure >> containerName [
	"The name of the symbol containing this symbol. This information is for
user interface purposes (e.g. to render a qualifier in the user interface
if necessary). It can't be used to re-infer a hierarchy for the document
symbols."

	^ data at: 'containerName' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPBaseSymbolInformationStructure >> containerName: anObject [
	data at: 'containerName' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPBaseSymbolInformationStructure >> kind [
	"The kind of this symbol."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPBaseSymbolInformationStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPBaseSymbolInformationStructure >> name [
	"The name of this symbol."

	^ data at: 'name'
]

{ #category : #accessing }
GtLSPBaseSymbolInformationStructure >> name: anObject [
	data at: 'name' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPBaseSymbolInformationStructure >> tags [
	"Tags for this symbol.

@since 3.16.0"

	^ data at: 'tags' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPBaseSymbolInformationStructure >> tags: anObject [
	data at: 'tags' put:  (self objectFor: anObject)
]
