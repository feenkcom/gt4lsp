Class {
	#name : #GtLSPInlineCompletionClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlineCompletionClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration for inline completion providers."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPInlineCompletionClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
