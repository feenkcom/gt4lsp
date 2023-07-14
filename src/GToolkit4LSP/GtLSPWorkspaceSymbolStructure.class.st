Class {
	#name : #GtLSPWorkspaceSymbolStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> containerName [
	"The name of the symbol containing this symbol. This information is for
user interface purposes (e.g. to render a qualifier in the user interface
if necessary). It can't be used to re-infer a hierarchy for the document
symbols."

	^ data at: 'containerName' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> containerName: anObject [
	data at: 'containerName' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> data [
	"A data entry field that is preserved on a workspace symbol between a
workspace symbol request and a workspace symbol resolve request."

	^ data at: 'data' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> kind [
	"The kind of this symbol."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> location [
	"The location of the symbol. Whether a server is allowed to
return a location without a range depends on the client
capability `workspace.symbol.resolveSupport`.

See SymbolInformation#location for more details."

	^ data at: 'location'
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> location: anObject [
	data at: 'location' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> name [
	"The name of this symbol."

	^ data at: 'name'
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> name: anObject [
	data at: 'name' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> tags [
	"Tags for this symbol.

@since 3.16.0"

	^ data at: 'tags' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceSymbolStructure >> tags: anObject [
	data at: 'tags' put:  (self objectFor: anObject)
]
