Class {
	#name : #GtLSPDocumentDiagnosticParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDocumentDiagnosticParamsStructure >> create [
	data at: 'textDocument' put: GtLSPTextDocumentIdentifierStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> identifier [
	"The additional identifier  provided during registration."

	^ data at: 'identifier' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> identifier: anObject [
	data at: 'identifier' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> previousResultId [
	"The result id of a previous response if provided."

	^ data at: 'previousResultId' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> previousResultId: anObject [
	data at: 'previousResultId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> textDocument [
	"The text document."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentIdentifierStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentDiagnosticParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
