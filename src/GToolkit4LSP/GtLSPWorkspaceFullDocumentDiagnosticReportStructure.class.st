Class {
	#name : #GtLSPWorkspaceFullDocumentDiagnosticReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> create [
	data at: 'items' put: #()
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> items [
	"The actual items."

	^ data at: 'items'
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> items: anObject [
	data at: 'items' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> kind [
	"A full document diagnostic report."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> resultId [
	"An optional result id. If provided it will
be sent on the next diagnostic request for the
same document."

	^ data at: 'resultId'
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> resultId: anObject [
	data at: 'resultId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> uri [
	"The URI for which diagnostic information is reported."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> version [
	"The version number for which the diagnostics are reported.
If the document is not marked as open `null` can be provided."

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPWorkspaceFullDocumentDiagnosticReportStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
