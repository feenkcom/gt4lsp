Class {
	#name : #GtLSPOptionalVersionedTextDocumentIdentifierStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPOptionalVersionedTextDocumentIdentifierStructure >> version [
	"The version number of this document. If a versioned text document identifier
is sent from the server to the client and the file is not open in the editor
(the server has not received an open notification before) the server can send
`null` to indicate that the version is unknown and the content on disk is the
truth (as specified with document content ownership)."

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPOptionalVersionedTextDocumentIdentifierStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
