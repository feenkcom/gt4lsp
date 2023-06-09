Class {
	#name : #GtLSPInlineCompletionTriggerKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPInlineCompletionTriggerKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Invoked' 'Invoked' 'Completion was triggered explicitly by a user gesture.')
		#('Automatic' 'Automatic' 'Completion was triggered automatically while editing.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
