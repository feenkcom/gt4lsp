Class {
	#name : #GtLSPHoverOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPHoverOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPHoverOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
