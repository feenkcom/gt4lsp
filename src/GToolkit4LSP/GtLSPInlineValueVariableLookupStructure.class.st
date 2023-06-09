Class {
	#name : #GtLSPInlineValueVariableLookupStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlineValueVariableLookupStructure >> caseSensitiveLookup [
	"How to perform the lookup."

	^ data at: 'caseSensitiveLookup'
]

{ #category : #accessing }
GtLSPInlineValueVariableLookupStructure >> caseSensitiveLookup: anObject [
	data at: 'caseSensitiveLookup' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPInlineValueVariableLookupStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPInlineValueVariableLookupStructure >> range [
	"The document range for which the inline value applies.
The range is used to extract the variable name from the underlying document."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineValueVariableLookupStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineValueVariableLookupStructure >> variableName [
	"If specified the name of the variable to look up."

	^ data at: 'variableName'
]

{ #category : #accessing }
GtLSPInlineValueVariableLookupStructure >> variableName: anObject [
	data at: 'variableName' put:  (self objectFor: anObject)
]
