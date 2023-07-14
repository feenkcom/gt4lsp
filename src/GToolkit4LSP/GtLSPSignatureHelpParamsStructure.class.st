Class {
	#name : #GtLSPSignatureHelpParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSignatureHelpParamsStructure >> context [
	"The signature help context. This is only available if the client specifies
to send this using the client capability `textDocument.signatureHelp.contextSupport === true`

@since 3.15.0"

	^ (data at: 'context' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPSignatureHelpContextStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSignatureHelpParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPSignatureHelpParamsStructure >> create [
	data
		at: 'textDocument'
		put: GtLSPTextDocumentIdentifierStructure create asDictionary.
	data at: 'position' put: GtLSPPositionStructure create asDictionary
]

{ #category : #accessing }
GtLSPSignatureHelpParamsStructure >> position [
	"The position inside the text document."

	^ (data at: 'position') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSignatureHelpParamsStructure >> position: anObject [
	data at: 'position' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSignatureHelpParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSignatureHelpParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
