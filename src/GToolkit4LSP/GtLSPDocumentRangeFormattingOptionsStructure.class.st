Class {
	#name : #GtLSPDocumentRangeFormattingOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentRangeFormattingOptionsStructure >> rangesSupport [
	"Whether the server supports formatting multiple ranges at once.

@since 3.18.0
@proposed"

	^ data at: 'rangesSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingOptionsStructure >> rangesSupport: anObject [
	data at: 'rangesSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentRangeFormattingOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
