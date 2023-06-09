Class {
	#name : #GtLSPCompletionItemKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPCompletionItemKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Text' 'Text' nil)
		#('Method' 'Method' nil)
		#('Function' 'Function' nil)
		#('Constructor' 'Constructor' nil)
		#('Field' 'Field' nil)
		#('Variable' 'Variable' nil)
		#('Class' 'Class' nil)
		#('Interface' 'Interface' nil)
		#('Module' 'Module' nil)
		#('Property' 'Property' nil)
		#('Unit' 'Unit' nil)
		#('Value' 'Value' nil)
		#('Enum' 'Enum' nil)
		#('Keyword' 'Keyword' nil)
		#('Snippet' 'Snippet' nil)
		#('Color' 'Color' nil)
		#('File' 'File' nil)
		#('Reference' 'Reference' nil)
		#('Folder' 'Folder' nil)
		#('EnumMember' 'EnumMember' nil)
		#('Constant' 'Constant' nil)
		#('Struct' 'Struct' nil)
		#('Event' 'Event' nil)
		#('Operator' 'Operator' nil)
		#('TypeParameter' 'TypeParameter' nil)
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
