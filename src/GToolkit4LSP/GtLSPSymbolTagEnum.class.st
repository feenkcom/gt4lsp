Class {
	#name : #GtLSPSymbolTagEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPSymbolTagEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Deprecated' 'Deprecated' 'Render a symbol as obsolete, usually using a strike-out.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
