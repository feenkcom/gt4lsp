Class {
	#name : #GtLSPClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> experimental [
	"Experimental client capabilities."

	^ data at: 'experimental' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> experimental: anObject [
	data at: 'experimental' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> general [
	"General client capabilities.

@since 3.16.0"

	^ (data at: 'general' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPGeneralClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> general: anObject [
	data at: 'general' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> notebookDocument [
	"Capabilities specific to the notebook document support.

@since 3.17.0"

	^ (data at: 'notebookDocument' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPNotebookDocumentClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> notebookDocument: anObject [
	data at: 'notebookDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> textDocument [
	"Text document specific client capabilities."

	^ (data at: 'textDocument' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPTextDocumentClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> textDocument: anObject [
	data at: 'textDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> window [
	"Window specific client capabilities."

	^ (data at: 'window' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPWindowClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> window: anObject [
	data at: 'window' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> workspace [
	"Workspace specific client capabilities."

	^ (data at: 'workspace' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPWorkspaceClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPClientCapabilitiesStructure >> workspace: anObject [
	data at: 'workspace' put:  (self objectFor: anObject)
]
