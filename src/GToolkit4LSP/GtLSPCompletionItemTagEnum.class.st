Class {
	#name : #GtLSPCompletionItemTagEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPCompletionItemTagEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Deprecated' 'Deprecated' 'Render a completion as obsolete, usually using a strike-out.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
