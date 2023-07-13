Class {
	#name : #GtLSPRelatedFullDocumentDiagnosticReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> create [
	data at: 'items' put: #()
]

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> items [
	"The actual items."

	^ data at: 'items'
]

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> items: anObject [
	data at: 'items' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> kind [
	"A full document diagnostic report."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> relatedDocuments [
	"Diagnostics of related documents. This information is useful
in programming languages where code in a file A can generate
diagnostics in a file B which A depends on. An example of
such a language is C/C++ where marco definitions in a file
a.cpp and result in errors in a header file b.hpp.

@since 3.17.0"

	^ data at: 'relatedDocuments' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> relatedDocuments: anObject [
	data at: 'relatedDocuments' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> resultId [
	"An optional result id. If provided it will
be sent on the next diagnostic request for the
same document."

	^ data at: 'resultId' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> resultId: anObject [
	data at: 'resultId' put:  (self objectFor: anObject)
]
