Class {
	#name : #GtLSPDocumentLinkOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentLinkOptionsStructure >> resolveProvider [
	"Document links have a resolve provider as well."

	^ data at: 'resolveProvider'
]

{ #category : #accessing }
GtLSPDocumentLinkOptionsStructure >> resolveProvider: anObject [
	data at: 'resolveProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentLinkOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPDocumentLinkOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
