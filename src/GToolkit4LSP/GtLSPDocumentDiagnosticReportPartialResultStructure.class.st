Class {
	#name : #GtLSPDocumentDiagnosticReportPartialResultStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentDiagnosticReportPartialResultStructure >> relatedDocuments [
	^ data at: 'relatedDocuments'
]

{ #category : #accessing }
GtLSPDocumentDiagnosticReportPartialResultStructure >> relatedDocuments: anObject [
	data at: 'relatedDocuments' put:  (self objectFor: anObject)
]
