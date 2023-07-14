Class {
	#name : #GtLSPInlineValueEvaluatableExpressionStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPInlineValueEvaluatableExpressionStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPInlineValueEvaluatableExpressionStructure >> expression [
	"If specified the expression overrides the extracted expression."

	^ data at: 'expression' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPInlineValueEvaluatableExpressionStructure >> expression: anObject [
	data at: 'expression' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineValueEvaluatableExpressionStructure >> range [
	"The document range for which the inline value applies.
The range is used to extract the evaluatable expression from the underlying document."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure on: obj ]
]

{ #category : #accessing }
GtLSPInlineValueEvaluatableExpressionStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]
