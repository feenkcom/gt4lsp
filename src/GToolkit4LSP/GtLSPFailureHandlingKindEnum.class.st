Class {
	#name : #GtLSPFailureHandlingKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPFailureHandlingKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Abort' 'Abort' 'Applying the workspace change is simply aborted if one of the changes provided
fails. All operations executed before the failing operation stay executed.')
		#('Transactional' 'Transactional' 'All operations are executed transactional. That means they either all
succeed or no changes at all are applied to the workspace.')
		#('TextOnlyTransactional' 'TextOnlyTransactional' 'If the workspace edit contains only textual file changes they are executed transactional.
If resource changes (create, rename or delete file) are part of the change the failure
handling strategy is abort.')
		#('Undo' 'Undo' 'The client tries to undo the operations already executed. But there is no
guarantee that this is succeeding.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
