Class {
	#name : #GtLSPDocumentDiagnosticReportKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPDocumentDiagnosticReportKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Full' 'full' 'A diagnostic report with a full
set of problems.')
		#('Unchanged' 'unchanged' 'A report indicating that the last
returned report is still accurate.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
