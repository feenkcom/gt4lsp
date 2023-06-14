Class {
	#name : #GtLSPCompletionTriggerKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPCompletionTriggerKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Invoked' 1 'Completion was triggered by typing an identifier (24x7 code
complete), manual invocation (e.g Ctrl+Space) or via API.')
		#('TriggerCharacter' 2 'Completion was triggered by a trigger character specified by
the `triggerCharacters` properties of the `CompletionRegistrationOptions`.')
		#('TriggerForIncompleteCompletions' 3 'Completion was re-triggered as current completion list is incomplete')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
