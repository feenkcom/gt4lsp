Class {
	#name : #GtLSPDiagnosticTagEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPDiagnosticTagEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Unnecessary' 'Unnecessary' 'Unused or unnecessary code.

Clients are allowed to render diagnostics with this tag faded out instead of having
an error squiggle.')
		#('Deprecated' 'Deprecated' 'Deprecated or obsolete code.

Clients are allowed to rendered diagnostics with this tag strike through.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
