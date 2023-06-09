Class {
	#name : #GtLSPCodeLensOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeLensOptionsStructure >> resolveProvider [
	"Code lens has a resolve provider as well."

	^ data at: 'resolveProvider'
]

{ #category : #accessing }
GtLSPCodeLensOptionsStructure >> resolveProvider: anObject [
	data at: 'resolveProvider' put:  (self objectFor: anObject)
]
