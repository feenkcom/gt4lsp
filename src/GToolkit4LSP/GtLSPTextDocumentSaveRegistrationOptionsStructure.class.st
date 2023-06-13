Class {
	#name : #GtLSPTextDocumentSaveRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTextDocumentSaveRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPTextDocumentSaveRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentSaveRegistrationOptionsStructure >> includeText [
	"The client is supposed to include the content on save."

	^ data at: 'includeText'
]

{ #category : #accessing }
GtLSPTextDocumentSaveRegistrationOptionsStructure >> includeText: anObject [
	data at: 'includeText' put:  (self objectFor: anObject)
]
