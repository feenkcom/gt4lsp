Class {
	#name : #GtLSPMonikerKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPMonikerKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('import' 'import' 'The moniker represent a symbol that is imported into a project')
		#('export' 'export' 'The moniker represents a symbol that is exported from a project')
		#('local' 'local' 'The moniker represents a symbol that is local to a project (e.g. a local
variable of a function, a class not visible outside the project, ...)')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
