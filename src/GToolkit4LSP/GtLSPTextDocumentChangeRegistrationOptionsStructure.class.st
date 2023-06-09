Class {
	#name : #GtLSPTextDocumentChangeRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTextDocumentChangeRegistrationOptionsStructure >> syncKind [
	"How documents are synced to the server."

	^ data at: 'syncKind'
]

{ #category : #accessing }
GtLSPTextDocumentChangeRegistrationOptionsStructure >> syncKind: anObject [
	data at: 'syncKind' put:  (self objectFor: anObject)
]
