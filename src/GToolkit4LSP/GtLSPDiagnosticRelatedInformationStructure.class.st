Class {
	#name : #GtLSPDiagnosticRelatedInformationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDiagnosticRelatedInformationStructure >> create [
	data at: 'location' put: GtLSPLocationStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDiagnosticRelatedInformationStructure >> location [
	"The location of this related diagnostic information."

	^ (data at: 'location') ifNotNil: [ :obj | GtLSPLocationStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDiagnosticRelatedInformationStructure >> location: anObject [
	data at: 'location' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticRelatedInformationStructure >> message [
	"The message of this related diagnostic information."

	^ data at: 'message'
]

{ #category : #accessing }
GtLSPDiagnosticRelatedInformationStructure >> message: anObject [
	data at: 'message' put:  (self objectFor: anObject)
]
