Class {
	#name : #GtLSPUnregistrationParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPUnregistrationParamsStructure >> create [
	data at: 'unregisterations' put: #()
]

{ #category : #accessing }
GtLSPUnregistrationParamsStructure >> unregisterations [
	^ data at: 'unregisterations'
]

{ #category : #accessing }
GtLSPUnregistrationParamsStructure >> unregisterations: anObject [
	data at: 'unregisterations' put:  (self objectFor: anObject)
]
