Class {
	#name : #GtLSPDocumentRangeFormattingRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentRangeFormattingRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingRegistrationOptionsStructure >> rangesSupport [
	"Whether the server supports formatting multiple ranges at once.

@since 3.18.0
@proposed"

	^ data at: 'rangesSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingRegistrationOptionsStructure >> rangesSupport: anObject [
	data at: 'rangesSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
