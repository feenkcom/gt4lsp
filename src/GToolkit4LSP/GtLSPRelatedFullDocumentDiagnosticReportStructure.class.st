Class {
	#name : #GtLSPRelatedFullDocumentDiagnosticReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> relatedDocuments [
	"Diagnostics of related documents. This information is useful
in programming languages where code in a file A can generate
diagnostics in a file B which A depends on. An example of
such a language is C/C++ where marco definitions in a file
a.cpp and result in errors in a header file b.hpp.

@since 3.17.0"

	^ data at: 'relatedDocuments'
]

{ #category : #accessing }
GtLSPRelatedFullDocumentDiagnosticReportStructure >> relatedDocuments: anObject [
	data at: 'relatedDocuments' put:  (self objectFor: anObject)
]
