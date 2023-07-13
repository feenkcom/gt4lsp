Class {
	#name : #GtLSPRenameFileOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRenameFileOptionsStructure >> ignoreIfExists [
	"Ignores if target exists."

	^ data at: 'ignoreIfExists' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPRenameFileOptionsStructure >> ignoreIfExists: anObject [
	data at: 'ignoreIfExists' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameFileOptionsStructure >> overwrite [
	"Overwrite target if existing. Overwrite wins over `ignoreIfExists`"

	^ data at: 'overwrite' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPRenameFileOptionsStructure >> overwrite: anObject [
	data at: 'overwrite' put:  (self objectFor: anObject)
]
