Class {
	#name : #GtLSPNotebookDocumentClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPNotebookDocumentClientCapabilitiesStructure >> create [
	data at: 'synchronization' put: GtLSPNotebookDocumentSyncClientCapabilitiesStructure create  asDictionary
]

{ #category : #accessing }
GtLSPNotebookDocumentClientCapabilitiesStructure >> synchronization [
	"Capabilities specific to notebook document synchronization

@since 3.17.0"

	^ (data at: 'synchronization') ifNotNil: [ :obj | GtLSPNotebookDocumentSyncClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPNotebookDocumentClientCapabilitiesStructure >> synchronization: anObject [
	data at: 'synchronization' put:  (self objectFor: anObject)
]
