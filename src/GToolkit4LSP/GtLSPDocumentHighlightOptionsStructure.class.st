Class {
	#name : #GtLSPDocumentHighlightOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentHighlightOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentHighlightOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
