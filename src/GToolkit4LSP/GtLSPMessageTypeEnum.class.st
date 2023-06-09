Class {
	#name : #GtLSPMessageTypeEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPMessageTypeEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Error' 'Error' 'An error message.')
		#('Warning' 'Warning' 'A warning message.')
		#('Info' 'Info' 'An information message.')
		#('Log' 'Log' 'A log message.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
