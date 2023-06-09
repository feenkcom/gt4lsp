Class {
	#name : #GtLSPLogTraceParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPLogTraceParamsStructure >> message [
	^ data at: 'message'
]

{ #category : #accessing }
GtLSPLogTraceParamsStructure >> message: anObject [
	data at: 'message' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPLogTraceParamsStructure >> verbose [
	^ data at: 'verbose'
]

{ #category : #accessing }
GtLSPLogTraceParamsStructure >> verbose: anObject [
	data at: 'verbose' put:  (self objectFor: anObject)
]
