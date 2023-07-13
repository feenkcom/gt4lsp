Class {
	#name : #GtLSPWorkDoneProgressOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkDoneProgressOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkDoneProgressOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
