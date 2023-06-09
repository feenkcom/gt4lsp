Class {
	#name : #GtLSPNotebookDocumentSyncClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPNotebookDocumentSyncClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration. If this is
set to `true` the client supports the new
`(TextDocumentRegistrationOptions & StaticRegistrationOptions)`
return value for the corresponding server capability as well."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncClientCapabilitiesStructure >> executionSummarySupport [
	"The client supports sending execution summary data per cell."

	^ data at: 'executionSummarySupport'
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncClientCapabilitiesStructure >> executionSummarySupport: anObject [
	data at: 'executionSummarySupport' put:  (self objectFor: anObject)
]
