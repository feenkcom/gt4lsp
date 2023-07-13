Class {
	#name : #GtLSPPartialResultParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPPartialResultParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPPartialResultParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]
