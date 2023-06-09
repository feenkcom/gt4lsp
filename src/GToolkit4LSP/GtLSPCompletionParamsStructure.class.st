Class {
	#name : #GtLSPCompletionParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCompletionParamsStructure >> context [
	"The completion context. This is only available it the client specifies
to send this using the client capability `textDocument.completion.contextSupport === true`"

	^ (data at: 'context') ifNotNil: [ :obj | GtLSPCompletionContextStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCompletionParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]
