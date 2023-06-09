Class {
	#name : #GtLSPPublishDiagnosticsParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPPublishDiagnosticsParamsStructure >> create [
	data at: 'diagnostics' put: #()
]

{ #category : #accessing }
GtLSPPublishDiagnosticsParamsStructure >> diagnostics [
	"An array of diagnostic information items."

	^ data at: 'diagnostics'
]

{ #category : #accessing }
GtLSPPublishDiagnosticsParamsStructure >> diagnostics: anObject [
	data at: 'diagnostics' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPublishDiagnosticsParamsStructure >> uri [
	"The URI for which diagnostic information is reported."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPPublishDiagnosticsParamsStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPublishDiagnosticsParamsStructure >> version [
	"Optional the version number of the document the diagnostics are published for.

@since 3.15.0"

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPPublishDiagnosticsParamsStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
