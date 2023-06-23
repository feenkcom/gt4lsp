Class {
	#name : #GtLSPDeleteFileStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDeleteFileStructure >> annotationId [
	"An optional annotation identifier describing the operation.

@since 3.16.0"

	^ data at: 'annotationId'
]

{ #category : #accessing }
GtLSPDeleteFileStructure >> annotationId: anObject [
	data at: 'annotationId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDeleteFileStructure >> kind [
	"The resource operation kind."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPDeleteFileStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDeleteFileStructure >> options [
	"Delete options."

	^ (data at: 'options') ifNotNil: [ :obj | GtLSPDeleteFileOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDeleteFileStructure >> options: anObject [
	data at: 'options' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDeleteFileStructure >> uri [
	"The file to delete."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPDeleteFileStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]