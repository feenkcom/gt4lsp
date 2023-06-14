Class {
	#name : #GtLSPSignatureHelpTriggerKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPSignatureHelpTriggerKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Invoked' 1 'Signature help was invoked manually by the user or by a command.')
		#('TriggerCharacter' 2 'Signature help was triggered by a trigger character.')
		#('ContentChange' 3 'Signature help was triggered by the cursor moving or by the document content changing.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
