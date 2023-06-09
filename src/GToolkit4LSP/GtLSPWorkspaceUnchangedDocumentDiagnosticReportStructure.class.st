Class {
	#name : #GtLSPWorkspaceUnchangedDocumentDiagnosticReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

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
