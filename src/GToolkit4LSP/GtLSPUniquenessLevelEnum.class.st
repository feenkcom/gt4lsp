Class {
	#name : #GtLSPUniquenessLevelEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPUniquenessLevelEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('document' 'document' 'The moniker is only unique inside a document')
		#('project' 'project' 'The moniker is unique inside a project for which a dump got created')
		#('group' 'group' 'The moniker is unique inside the group to which a project belongs')
		#('scheme' 'scheme' 'The moniker is unique inside the moniker scheme.')
		#('global' 'global' 'The moniker is globally unique')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
