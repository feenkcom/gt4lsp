Class {
	#name : #GtLSPInlineCompletionParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> context [
	"Additional information about the context in which inline completions were
requested."

	^ (data at: 'context') ifNotNil: [ :obj | GtLSPInlineCompletionContextStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineCompletionParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPInlineCompletionParamsStructure >> create [
	data at: 'context' put: GtLSPInlineCompletionContextStructure create  asDictionary
]
