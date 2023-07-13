Class {
	#name : #GtLSPDocumentOnTypeFormattingOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingOptionsStructure >> firstTriggerCharacter [
	"A character on which formatting should be triggered, like `{`."

	^ data at: 'firstTriggerCharacter'
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingOptionsStructure >> firstTriggerCharacter: anObject [
	data at: 'firstTriggerCharacter' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingOptionsStructure >> moreTriggerCharacter [
	"More trigger characters."

	^ data at: 'moreTriggerCharacter' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingOptionsStructure >> moreTriggerCharacter: anObject [
	data at: 'moreTriggerCharacter' put:  (self objectFor: anObject)
]
