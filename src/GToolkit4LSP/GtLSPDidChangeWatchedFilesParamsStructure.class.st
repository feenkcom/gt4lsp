Class {
	#name : #GtLSPDidChangeWatchedFilesParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDidChangeWatchedFilesParamsStructure >> changes [
	"The actual file events."

	^ data at: 'changes'
]

{ #category : #accessing }
GtLSPDidChangeWatchedFilesParamsStructure >> changes: anObject [
	data at: 'changes' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPDidChangeWatchedFilesParamsStructure >> create [
	data at: 'changes' put: #()
]
