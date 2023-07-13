Class {
	#name : #GtLSPRenameOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRenameOptionsStructure >> prepareProvider [
	"Renames should be checked and tested before being executed.

@since version 3.12.0"

	^ data at: 'prepareProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPRenameOptionsStructure >> prepareProvider: anObject [
	data at: 'prepareProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPRenameOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
