Class {
	#name : #GtLSPMessageTypeEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPMessageTypeEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Error' 1 'An error message.')
		#('Warning' 2 'A warning message.')
		#('Info' 3 'An information message.')
		#('Log' 4 'A log message.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
