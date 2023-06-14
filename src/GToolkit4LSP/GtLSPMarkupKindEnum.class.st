Class {
	#name : #GtLSPMarkupKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPMarkupKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('PlainText' 'plaintext' 'Plain text is supported as a content format')
		#('Markdown' 'markdown' 'Markdown is supported as a content format')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
