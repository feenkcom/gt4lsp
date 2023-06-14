Class {
	#name : #GtLSPSymbolKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPSymbolKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('File' 1 nil)
		#('Module' 2 nil)
		#('Namespace' 3 nil)
		#('Package' 4 nil)
		#('Class' 5 nil)
		#('Method' 6 nil)
		#('Property' 7 nil)
		#('Field' 8 nil)
		#('Constructor' 9 nil)
		#('Enum' 10 nil)
		#('Interface' 11 nil)
		#('Function' 12 nil)
		#('Variable' 13 nil)
		#('Constant' 14 nil)
		#('String' 15 nil)
		#('Number' 16 nil)
		#('Boolean' 17 nil)
		#('Array' 18 nil)
		#('Object' 19 nil)
		#('Key' 20 nil)
		#('Null' 21 nil)
		#('EnumMember' 22 nil)
		#('Struct' 23 nil)
		#('Event' 24 nil)
		#('Operator' 25 nil)
		#('TypeParameter' 26 nil)
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
