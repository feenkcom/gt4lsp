Class {
	#name : #GtLSPFullDocumentDiagnosticReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPFullDocumentDiagnosticReportStructure >> create [
	data at: 'items' put: #()
]

{ #category : #accessing }
GtLSPFullDocumentDiagnosticReportStructure >> items [
	"The actual items."

	^ data at: 'items'
]

{ #category : #accessing }
GtLSPFullDocumentDiagnosticReportStructure >> items: anObject [
	data at: 'items' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFullDocumentDiagnosticReportStructure >> kind [
	"A full document diagnostic report."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPFullDocumentDiagnosticReportStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFullDocumentDiagnosticReportStructure >> resultId [
	"An optional result id. If provided it will
be sent on the next diagnostic request for the
same document."

	^ data at: 'resultId' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFullDocumentDiagnosticReportStructure >> resultId: anObject [
	data at: 'resultId' put:  (self objectFor: anObject)
]
