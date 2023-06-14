Class {
	#name : #GtLSPCompletionItemKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPCompletionItemKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Text' 1 nil)
		#('Method' 2 nil)
		#('Function' 3 nil)
		#('Constructor' 4 nil)
		#('Field' 5 nil)
		#('Variable' 6 nil)
		#('Class' 7 nil)
		#('Interface' 8 nil)
		#('Module' 9 nil)
		#('Property' 10 nil)
		#('Unit' 11 nil)
		#('Value' 12 nil)
		#('Enum' 13 nil)
		#('Keyword' 14 nil)
		#('Snippet' 15 nil)
		#('Color' 16 nil)
		#('File' 17 nil)
		#('Reference' 18 nil)
		#('Folder' 19 nil)
		#('EnumMember' 20 nil)
		#('Constant' 21 nil)
		#('Struct' 22 nil)
		#('Event' 23 nil)
		#('Operator' 24 nil)
		#('TypeParameter' 25 nil)
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
