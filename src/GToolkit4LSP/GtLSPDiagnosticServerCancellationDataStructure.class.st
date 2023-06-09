Class {
	#name : #GtLSPDiagnosticServerCancellationDataStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDiagnosticServerCancellationDataStructure >> retriggerRequest [
	^ data at: 'retriggerRequest'
]

{ #category : #accessing }
GtLSPDiagnosticServerCancellationDataStructure >> retriggerRequest: anObject [
	data at: 'retriggerRequest' put:  (self objectFor: anObject)
]
