Class {
	#name : #GtLSPLinkedEditingRangeOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPLinkedEditingRangeOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPLinkedEditingRangeOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
