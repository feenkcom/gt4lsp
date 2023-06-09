Class {
	#name : #GtLSPExecutionSummaryStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPExecutionSummaryStructure >> executionOrder [
	"A strict monotonically increasing value
indicating the execution order of a cell
inside a notebook."

	^ data at: 'executionOrder'
]

{ #category : #accessing }
GtLSPExecutionSummaryStructure >> executionOrder: anObject [
	data at: 'executionOrder' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPExecutionSummaryStructure >> success [
	"Whether the execution was successful or
not if known by the client."

	^ data at: 'success'
]

{ #category : #accessing }
GtLSPExecutionSummaryStructure >> success: anObject [
	data at: 'success' put:  (self objectFor: anObject)
]
