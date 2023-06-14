Class {
	#name : #GtLSPDocumentHighlightKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPDocumentHighlightKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Text' 1 'A textual occurrence.')
		#('Read' 2 'Read-access of a symbol, like reading a variable.')
		#('Write' 3 'Write-access of a symbol, like writing to a variable.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
