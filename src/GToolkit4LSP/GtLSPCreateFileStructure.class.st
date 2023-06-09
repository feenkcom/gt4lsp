Class {
	#name : #GtLSPCreateFileStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCreateFileStructure >> kind [
	"A create"

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPCreateFileStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCreateFileStructure >> options [
	"Additional options"

	^ (data at: 'options') ifNotNil: [ :obj | GtLSPCreateFileOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCreateFileStructure >> options: anObject [
	data at: 'options' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCreateFileStructure >> uri [
	"The resource to create."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPCreateFileStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
