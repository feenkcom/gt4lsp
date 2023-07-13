Class {
	#name : #GtLSPDocumentFormattingClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentFormattingClientCapabilitiesStructure >> dynamicRegistration [
	"Whether formatting supports dynamic registration."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentFormattingClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
