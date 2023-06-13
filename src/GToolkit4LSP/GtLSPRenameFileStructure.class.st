Class {
	#name : #GtLSPRenameFileStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRenameFileStructure >> annotationId [
	"An optional annotation identifier describing the operation.

@since 3.16.0"

	^ data at: 'annotationId'
]

{ #category : #accessing }
GtLSPRenameFileStructure >> annotationId: anObject [
	data at: 'annotationId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameFileStructure >> kind [
	"The resource operation kind."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPRenameFileStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameFileStructure >> newUri [
	"The new location."

	^ data at: 'newUri'
]

{ #category : #accessing }
GtLSPRenameFileStructure >> newUri: anObject [
	data at: 'newUri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameFileStructure >> oldUri [
	"The old (existing) location."

	^ data at: 'oldUri'
]

{ #category : #accessing }
GtLSPRenameFileStructure >> oldUri: anObject [
	data at: 'oldUri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameFileStructure >> options [
	"Rename options."

	^ (data at: 'options') ifNotNil: [ :obj | GtLSPRenameFileOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPRenameFileStructure >> options: anObject [
	data at: 'options' put:  (self objectFor: anObject)
]
