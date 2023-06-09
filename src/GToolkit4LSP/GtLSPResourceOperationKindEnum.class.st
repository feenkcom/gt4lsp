Class {
	#name : #GtLSPResourceOperationKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPResourceOperationKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Create' 'Create' 'Supports creating new files and folders.')
		#('Rename' 'Rename' 'Supports renaming existing files and folders.')
		#('Delete' 'Delete' 'Supports deleting existing files and folders.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
