Class {
	#name : #GtLSPSymbolKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPSymbolKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('File' 'File' nil)
		#('Module' 'Module' nil)
		#('Namespace' 'Namespace' nil)
		#('Package' 'Package' nil)
		#('Class' 'Class' nil)
		#('Method' 'Method' nil)
		#('Property' 'Property' nil)
		#('Field' 'Field' nil)
		#('Constructor' 'Constructor' nil)
		#('Enum' 'Enum' nil)
		#('Interface' 'Interface' nil)
		#('Function' 'Function' nil)
		#('Variable' 'Variable' nil)
		#('Constant' 'Constant' nil)
		#('String' 'String' nil)
		#('Number' 'Number' nil)
		#('Boolean' 'Boolean' nil)
		#('Array' 'Array' nil)
		#('Object' 'Object' nil)
		#('Key' 'Key' nil)
		#('Null' 'Null' nil)
		#('EnumMember' 'EnumMember' nil)
		#('Struct' 'Struct' nil)
		#('Event' 'Event' nil)
		#('Operator' 'Operator' nil)
		#('TypeParameter' 'TypeParameter' nil)
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
