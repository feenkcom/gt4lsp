Class {
	#name : #GtLSPSemanticTokenTypesEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPSemanticTokenTypesEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('namespace' 'namespace' nil)
		#('type' 'type' 'Represents a generic type. Acts as a fallback for types which can''t be mapped to
a specific type like class or enum.')
		#('class' 'class' nil)
		#('enum' 'enum' nil)
		#('interface' 'interface' nil)
		#('struct' 'struct' nil)
		#('typeParameter' 'typeParameter' nil)
		#('parameter' 'parameter' nil)
		#('variable' 'variable' nil)
		#('property' 'property' nil)
		#('enumMember' 'enumMember' nil)
		#('event' 'event' nil)
		#('function' 'function' nil)
		#('method' 'method' nil)
		#('macro' 'macro' nil)
		#('keyword' 'keyword' nil)
		#('modifier' 'modifier' nil)
		#('comment' 'comment' nil)
		#('string' 'string' nil)
		#('number' 'number' nil)
		#('regexp' 'regexp' nil)
		#('operator' 'operator' nil)
		#('decorator' 'decorator' '@since 3.17.0')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
