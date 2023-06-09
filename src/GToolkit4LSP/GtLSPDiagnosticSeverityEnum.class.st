Class {
	#name : #GtLSPDiagnosticSeverityEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPDiagnosticSeverityEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Error' 'Error' 'Reports an error.')
		#('Warning' 'Warning' 'Reports a warning.')
		#('Information' 'Information' 'Reports an information.')
		#('Hint' 'Hint' 'Reports a hint.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
