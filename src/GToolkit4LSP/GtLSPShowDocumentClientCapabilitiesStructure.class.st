Class {
	#name : #GtLSPShowDocumentClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPShowDocumentClientCapabilitiesStructure >> support [
	"The client has support for the showDocument
request."

	^ data at: 'support'
]

{ #category : #accessing }
GtLSPShowDocumentClientCapabilitiesStructure >> support: anObject [
	data at: 'support' put:  (self objectFor: anObject)
]
