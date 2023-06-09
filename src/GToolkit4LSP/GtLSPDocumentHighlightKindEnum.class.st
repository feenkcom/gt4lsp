Class {
	#name : #GtLSPDocumentHighlightKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPDocumentHighlightKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Text' 'Text' 'A textual occurrence.')
		#('Read' 'Read' 'Read-access of a symbol, like reading a variable.')
		#('Write' 'Write' 'Write-access of a symbol, like writing to a variable.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
