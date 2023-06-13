Class {
	#name : #GtLSPRelatedUnchangedDocumentDiagnosticReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRelatedUnchangedDocumentDiagnosticReportStructure >> kind [
	"A document diagnostic report indicating
no changes to the last result. A server can
only return `unchanged` if result ids are
provided."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPRelatedUnchangedDocumentDiagnosticReportStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRelatedUnchangedDocumentDiagnosticReportStructure >> relatedDocuments [
	"Diagnostics of related documents. This information is useful
in programming languages where code in a file A can generate
diagnostics in a file B which A depends on. An example of
such a language is C/C++ where marco definitions in a file
a.cpp and result in errors in a header file b.hpp.

@since 3.17.0"

	^ data at: 'relatedDocuments'
]

{ #category : #accessing }
GtLSPRelatedUnchangedDocumentDiagnosticReportStructure >> relatedDocuments: anObject [
	data at: 'relatedDocuments' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRelatedUnchangedDocumentDiagnosticReportStructure >> resultId [
	"A result id which will be sent on the next
diagnostic request for the same document."

	^ data at: 'resultId'
]

{ #category : #accessing }
GtLSPRelatedUnchangedDocumentDiagnosticReportStructure >> resultId: anObject [
	data at: 'resultId' put:  (self objectFor: anObject)
]
