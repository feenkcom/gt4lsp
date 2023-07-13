Class {
	#name : #GtLSPDocumentOnTypeFormattingRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingRegistrationOptionsStructure >> firstTriggerCharacter [
	"A character on which formatting should be triggered, like `{`."

	^ data at: 'firstTriggerCharacter'
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingRegistrationOptionsStructure >> firstTriggerCharacter: anObject [
	data at: 'firstTriggerCharacter' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingRegistrationOptionsStructure >> moreTriggerCharacter [
	"More trigger characters."

	^ data at: 'moreTriggerCharacter' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingRegistrationOptionsStructure >> moreTriggerCharacter: anObject [
	data at: 'moreTriggerCharacter' put:  (self objectFor: anObject)
]
