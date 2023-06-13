Class {
	#name : #GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure >> kind [
	"A document diagnostic report indicating
no changes to the last result. A server can
only return `unchanged` if result ids are
provided."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure >> resultId [
	"A result id which will be sent on the next
diagnostic request for the same document."

	^ data at: 'resultId'
]

{ #category : #accessing }
GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure >> resultId: anObject [
	data at: 'resultId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure >> uri [
	"The URI for which diagnostic information is reported."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure >> version [
	"The version number for which the diagnostics are reported.
If the document is not marked as open `null` can be provided."

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
