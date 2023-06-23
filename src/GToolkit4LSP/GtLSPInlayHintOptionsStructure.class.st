Class {
	#name : #GtLSPInlayHintOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlayHintOptionsStructure >> resolveProvider [
	"The server provides support to resolve additional
information for an inlay hint item."

	^ data at: 'resolveProvider'
]

{ #category : #accessing }
GtLSPInlayHintOptionsStructure >> resolveProvider: anObject [
	data at: 'resolveProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPInlayHintOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]