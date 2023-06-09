Class {
	#name : #GtLSPReferenceParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPReferenceParamsStructure >> context [
	^ (data at: 'context') ifNotNil: [ :obj | GtLSPReferenceContextStructure new data: obj ]
]

{ #category : #accessing }
GtLSPReferenceParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPReferenceParamsStructure >> create [
	data at: 'context' put: GtLSPReferenceContextStructure create  asDictionary
]
