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

	^ (data at: 'context') ifNotNil: [ :obj | GtLSPSignatureHelpContextStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSignatureHelpParamsStructure >> context: anObject [
	data at: 'context' put:  (self objectFor: anObject)
]
