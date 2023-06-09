Class {
	#name : #GtLSPSemanticTokenModifiersEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPSemanticTokenModifiersEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('declaration' 'declaration' nil)
		#('definition' 'definition' nil)
		#('readonly' 'readonly' nil)
		#('static' 'static' nil)
		#('deprecated' 'deprecated' nil)
		#('abstract' 'abstract' nil)
		#('async' 'async' nil)
		#('modification' 'modification' nil)
		#('documentation' 'documentation' nil)
		#('defaultLibrary' 'defaultLibrary' nil)
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
