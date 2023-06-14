Class {
	#name : #GtLSPResourceOperationKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPResourceOperationKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Create' 'create' 'Supports creating new files and folders.')
		#('Rename' 'rename' 'Supports renaming existing files and folders.')
		#('Delete' 'delete' 'Supports deleting existing files and folders.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
