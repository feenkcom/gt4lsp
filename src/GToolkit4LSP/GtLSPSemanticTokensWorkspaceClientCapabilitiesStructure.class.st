Class {
	#name : #GtLSPSemanticTokensWorkspaceClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSemanticTokensWorkspaceClientCapabilitiesStructure >> refreshSupport [
	"Whether the client implementation supports a refresh request sent from
the server to the client.

Note that this event is global and will force the client to refresh all
semantic tokens currently shown. It should be used with absolute care
and is useful for situation where a server for example detects a project
wide change that requires such a calculation."

	^ data at: 'refreshSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensWorkspaceClientCapabilitiesStructure >> refreshSupport: anObject [
	data at: 'refreshSupport' put:  (self objectFor: anObject)
]
