Class {
	#name : #GtLSPInlayHintKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPInlayHintKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Type' 'Type' 'An inlay hint that for a type annotation.')
		#('Parameter' 'Parameter' 'An inlay hint that is for a parameter.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
