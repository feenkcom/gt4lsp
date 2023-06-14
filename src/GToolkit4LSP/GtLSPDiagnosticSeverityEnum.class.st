Class {
	#name : #GtLSPDiagnosticSeverityEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPDiagnosticSeverityEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Error' 1 'Reports an error.')
		#('Warning' 2 'Reports a warning.')
		#('Information' 3 'Reports an information.')
		#('Hint' 4 'Reports a hint.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
