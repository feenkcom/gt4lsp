Class {
	#name : #GtLSPWorkspaceDiagnosticReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPWorkspaceDiagnosticReportStructure >> create [
	data at: 'items' put: #()
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticReportStructure >> items [
	^ data at: 'items'
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticReportStructure >> items: anObject [
	data at: 'items' put:  (self objectFor: anObject)
]
