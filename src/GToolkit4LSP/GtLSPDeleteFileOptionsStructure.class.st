Class {
	#name : #GtLSPDeleteFileOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDeleteFileOptionsStructure >> ignoreIfNotExists [
	"Ignore the operation if the file doesn't exist."

	^ data at: 'ignoreIfNotExists' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDeleteFileOptionsStructure >> ignoreIfNotExists: anObject [
	data at: 'ignoreIfNotExists' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDeleteFileOptionsStructure >> recursive [
	"Delete the content recursively if a folder is denoted."

	^ data at: 'recursive' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDeleteFileOptionsStructure >> recursive: anObject [
	data at: 'recursive' put:  (self objectFor: anObject)
]
