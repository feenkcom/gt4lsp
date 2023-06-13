Class {
	#name : #GtLSPTextDocumentChangeRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTextDocumentChangeRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPTextDocumentChangeRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentChangeRegistrationOptionsStructure >> syncKind [
	"How documents are synced to the server."

	^ data at: 'syncKind'
]

{ #category : #accessing }
GtLSPTextDocumentChangeRegistrationOptionsStructure >> syncKind: anObject [
	data at: 'syncKind' put:  (self objectFor: anObject)
]
