Class {
	#name : #GtLSPWatchKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPWatchKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Create' 1 'Interested in create events.')
		#('Change' 2 'Interested in change events')
		#('Delete' 4 'Interested in delete events')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
