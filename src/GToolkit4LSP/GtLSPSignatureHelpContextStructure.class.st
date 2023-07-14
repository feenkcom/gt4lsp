Class {
	#name : #GtLSPSignatureHelpContextStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSignatureHelpContextStructure >> activeSignatureHelp [
	"The currently active `SignatureHelp`.

The `activeSignatureHelp` has its `SignatureHelp.activeSignature` field updated based on
the user navigating through available signatures."

	^ (data at: 'activeSignatureHelp' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPSignatureHelpStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSignatureHelpContextStructure >> activeSignatureHelp: anObject [
	data at: 'activeSignatureHelp' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpContextStructure >> isRetrigger [
	"`true` if signature help was already showing when it was triggered.

Retriggers occurs when the signature help is already active and can be caused by actions such as
typing a trigger character, a cursor move, or document content changes."

	^ data at: 'isRetrigger'
]

{ #category : #accessing }
GtLSPSignatureHelpContextStructure >> isRetrigger: anObject [
	data at: 'isRetrigger' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpContextStructure >> triggerCharacter [
	"Character that caused signature help to be triggered.

This is undefined when `triggerKind !== SignatureHelpTriggerKind.TriggerCharacter`"

	^ data at: 'triggerCharacter' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSignatureHelpContextStructure >> triggerCharacter: anObject [
	data at: 'triggerCharacter' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpContextStructure >> triggerKind [
	"Action that caused signature help to be triggered."

	^ data at: 'triggerKind'
]

{ #category : #accessing }
GtLSPSignatureHelpContextStructure >> triggerKind: anObject [
	data at: 'triggerKind' put:  (self objectFor: anObject)
]
