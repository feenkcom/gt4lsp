Class {
	#name : #GtLSPSetTraceParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSetTraceParamsStructure >> value [
	^ data at: 'value'
]

{ #category : #accessing }
GtLSPSetTraceParamsStructure >> value: anObject [
	data at: 'value' put:  (self objectFor: anObject)
]
