Class {
	#name : #GtLSPInlineCompletionOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlineCompletionOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPInlineCompletionOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
