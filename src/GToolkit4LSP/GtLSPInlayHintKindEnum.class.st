Class {
	#name : #GtLSPInlayHintKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPInlayHintKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Type' 1 'An inlay hint that for a type annotation.')
		#('Parameter' 2 'An inlay hint that is for a parameter.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
