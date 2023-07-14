Class {
	#name : #GtLSPDocumentRangeFormattingClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentRangeFormattingClientCapabilitiesStructure >> dynamicRegistration [
	"Whether range formatting supports dynamic registration."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingClientCapabilitiesStructure >> rangesSupport [
	"Whether the client supports formatting multiple ranges at once.

@since 3.18.0
@proposed"

	^ data at: 'rangesSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingClientCapabilitiesStructure >> rangesSupport: anObject [
	data at: 'rangesSupport' put:  (self objectFor: anObject)
]
