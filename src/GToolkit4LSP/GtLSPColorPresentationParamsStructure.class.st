Class {
	#name : #GtLSPColorPresentationParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPColorPresentationParamsStructure >> color [
	"The color to request presentations for."

	^ (data at: 'color') ifNotNil: [ :obj | GtLSPColorStructure new data: obj ]
]

{ #category : #accessing }
GtLSPColorPresentationParamsStructure >> color: anObject [
	data at: 'color' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPColorPresentationParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary.
	data at: 'color' put: GtLSPColorStructure create  asDictionary.
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPColorPresentationParamsStructure >> range [
	"The range where the color would be inserted. Serves as a context."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPColorPresentationParamsStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPColorPresentationParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPColorPresentationParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]
