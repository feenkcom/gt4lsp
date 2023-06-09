Class {
	#name : #GtLSPDocumentHighlightClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentHighlightClientCapabilitiesStructure >> dynamicRegistration [
	"Whether document highlight supports dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPDocumentHighlightClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
