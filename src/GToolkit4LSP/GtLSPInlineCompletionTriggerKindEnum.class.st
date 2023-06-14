Class {
	#name : #GtLSPInlineCompletionTriggerKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPInlineCompletionTriggerKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Invoked' 0 'Completion was triggered explicitly by a user gesture.')
		#('Automatic' 1 'Completion was triggered automatically while editing.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
