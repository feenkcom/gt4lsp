Class {
	#name : #GtLSPWorkspaceDiagnosticReportPartialResultStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPWorkspaceDiagnosticReportPartialResultStructure >> create [
	data at: 'items' put: #()
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticReportPartialResultStructure >> items [
	^ data at: 'items'
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticReportPartialResultStructure >> items: anObject [
	data at: 'items' put:  (self objectFor: anObject)
]
