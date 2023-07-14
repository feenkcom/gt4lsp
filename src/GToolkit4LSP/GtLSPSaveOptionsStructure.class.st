Class {
	#name : #GtLSPSaveOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSaveOptionsStructure >> includeText [
	"The client is supposed to include the content on save."

	^ data at: 'includeText' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSaveOptionsStructure >> includeText: anObject [
	data at: 'includeText' put:  (self objectFor: anObject)
]
