Class {
	#name : #GtLSPCreateFileOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCreateFileOptionsStructure >> ignoreIfExists [
	"Ignore if exists."

	^ data at: 'ignoreIfExists'
]

{ #category : #accessing }
GtLSPCreateFileOptionsStructure >> ignoreIfExists: anObject [
	data at: 'ignoreIfExists' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCreateFileOptionsStructure >> overwrite [
	"Overwrite existing file. Overwrite wins over `ignoreIfExists`"

	^ data at: 'overwrite'
]

{ #category : #accessing }
GtLSPCreateFileOptionsStructure >> overwrite: anObject [
	data at: 'overwrite' put:  (self objectFor: anObject)
]
