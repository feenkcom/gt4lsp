Class {
	#name : #GtLSPDocumentOnTypeFormattingClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingClientCapabilitiesStructure >> dynamicRegistration [
	"Whether on type formatting supports dynamic registration."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentOnTypeFormattingClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
