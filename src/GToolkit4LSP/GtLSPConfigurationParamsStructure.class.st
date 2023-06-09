Class {
	#name : #GtLSPConfigurationParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPConfigurationParamsStructure >> create [
	data at: 'items' put: #()
]

{ #category : #accessing }
GtLSPConfigurationParamsStructure >> items [
	^ data at: 'items'
]

{ #category : #accessing }
GtLSPConfigurationParamsStructure >> items: anObject [
	data at: 'items' put:  (self objectFor: anObject)
]
