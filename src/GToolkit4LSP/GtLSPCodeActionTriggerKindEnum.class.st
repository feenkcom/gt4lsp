Class {
	#name : #GtLSPCodeActionTriggerKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPCodeActionTriggerKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Invoked' 'Invoked' 'Code actions were explicitly requested by the user or by an extension.')
		#('Automatic' 'Automatic' 'Code actions were requested automatically.

This typically happens when current selection in a file changes, but can
also be triggered when file content changes.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
