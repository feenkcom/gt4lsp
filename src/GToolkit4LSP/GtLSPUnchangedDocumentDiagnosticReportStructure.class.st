Class {
	#name : #GtLSPUnchangedDocumentDiagnosticReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPUnchangedDocumentDiagnosticReportStructure >> kind [
	"A document diagnostic report indicating
no changes to the last result. A server can
only return `unchanged` if result ids are
provided."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPUnchangedDocumentDiagnosticReportStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPUnchangedDocumentDiagnosticReportStructure >> resultId [
	"A result id which will be sent on the next
diagnostic request for the same document."

	^ data at: 'resultId'
]

{ #category : #accessing }
GtLSPUnchangedDocumentDiagnosticReportStructure >> resultId: anObject [
	data at: 'resultId' put:  (self objectFor: anObject)
]
