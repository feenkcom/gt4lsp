Class {
	#name : #GtLSPClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> experimental [
	"Experimental client capabilities."

	^ data at: 'experimental'
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> experimental: anObject [
	data at: 'experimental' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> general [
	"General client capabilities.

@since 3.16.0"

	^ (data at: 'general') ifNotNil: [ :obj | GtLSPGeneralClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> general: anObject [
	data at: 'general' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> notebookDocument [
	"Capabilities specific to the notebook document support.

@since 3.17.0"

	^ (data at: 'notebookDocument') ifNotNil: [ :obj | GtLSPNotebookDocumentClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> notebookDocument: anObject [
	data at: 'notebookDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> textDocument [
	"Text document specific client capabilities."

	^ (data at: 'textDocument') ifNotNil: [ :obj | GtLSPTextDocumentClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> window [
	"Window specific client capabilities."

	^ (data at: 'window') ifNotNil: [ :obj | GtLSPWindowClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> window: anObject [
	data at: 'window' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> workspace [
	"Workspace specific client capabilities."

	^ (data at: 'workspace') ifNotNil: [ :obj | GtLSPWorkspaceClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> workspace: anObject [
	data at: 'workspace' put:  (self objectFor: anObject)
]
