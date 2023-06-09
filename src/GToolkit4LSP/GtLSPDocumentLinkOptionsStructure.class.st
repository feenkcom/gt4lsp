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
