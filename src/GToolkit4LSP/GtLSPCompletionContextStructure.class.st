Class {
	#name : #GtLSPCompletionContextStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCompletionContextStructure >> triggerCharacter [
	"The trigger character (a single character) that has trigger code complete.
Is undefined if `triggerKind !== CompletionTriggerKind.TriggerCharacter`"

	^ data at: 'triggerCharacter' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionContextStructure >> triggerCharacter: anObject [
	data at: 'triggerCharacter' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionContextStructure >> triggerKind [
	"How the completion was triggered."

	^ data at: 'triggerKind'
]

{ #category : #accessing }
GtLSPCompletionContextStructure >> triggerKind: anObject [
	data at: 'triggerKind' put:  (self objectFor: anObject)
]
