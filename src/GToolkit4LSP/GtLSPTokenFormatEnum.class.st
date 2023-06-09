Class {
	#name : #GtLSPTokenFormatEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPTokenFormatEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Relative' 'Relative' nil)
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
