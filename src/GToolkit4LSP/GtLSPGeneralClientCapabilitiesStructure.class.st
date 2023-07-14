Class {
	#name : #GtLSPGeneralClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPGeneralClientCapabilitiesStructure >> markdown [
	"Client capabilities specific to the client's markdown parser.

@since 3.16.0"

	^ (data at: 'markdown' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPMarkdownClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPGeneralClientCapabilitiesStructure >> markdown: anObject [
	data at: 'markdown' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPGeneralClientCapabilitiesStructure >> positionEncodings [
	"The position encodings supported by the client. Client and server
have to agree on the same position encoding to ensure that offsets
(e.g. character position in a line) are interpreted the same on both
sides.

To keep the protocol backwards compatible the following applies: if
the value 'utf-16' is missing from the array of position encodings
servers can assume that the client supports UTF-16. UTF-16 is
therefore a mandatory encoding.

If omitted it defaults to ['utf-16'].

Implementation considerations: since the conversion from one encoding
into another requires the content of the file / line the conversion
is best done where the file is read which is usually on the server
side.

@since 3.17.0"

	^ data at: 'positionEncodings' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPGeneralClientCapabilitiesStructure >> positionEncodings: anObject [
	data at: 'positionEncodings' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPGeneralClientCapabilitiesStructure >> regularExpressions [
	"Client capabilities specific to regular expressions.

@since 3.16.0"

	^ (data at: 'regularExpressions' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPRegularExpressionsClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPGeneralClientCapabilitiesStructure >> regularExpressions: anObject [
	data at: 'regularExpressions' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPGeneralClientCapabilitiesStructure >> staleRequestSupport [
	"Client capability that signals how the client
handles stale requests (e.g. a request
for which the client will not process the response
anymore since the information is outdated).

@since 3.17.0"

	^ data at: 'staleRequestSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPGeneralClientCapabilitiesStructure >> staleRequestSupport: anObject [
	data at: 'staleRequestSupport' put:  (self objectFor: anObject)
]
