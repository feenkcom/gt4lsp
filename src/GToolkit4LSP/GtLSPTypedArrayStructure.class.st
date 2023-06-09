Class {
	#name : #GtLSPTypedArrayStructure,
	#superclass : #Object,
	#instVars : [
		'data',
		'structureClass'
	],
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTypedArrayStructure >> data [
	^ data
]

{ #category : #accessing }
GtLSPTypedArrayStructure >> data: anObject [
	data := anObject
]

{ #category : #accessing }
GtLSPTypedArrayStructure >> structureClass [
	^ structureClass
]

{ #category : #accessing }
GtLSPTypedArrayStructure >> structureClass: anObject [
	structureClass := anObject
]
