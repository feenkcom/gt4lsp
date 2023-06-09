Class {
	#name : #GtLSPWatchKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPWatchKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Create' 'Create' 'Interested in create events.')
		#('Change' 'Change' 'Interested in change events')
		#('Delete' 'Delete' 'Interested in delete events')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
