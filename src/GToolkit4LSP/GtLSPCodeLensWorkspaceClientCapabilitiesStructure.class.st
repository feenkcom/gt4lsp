Class {
	#name : #GtLSPCodeLensWorkspaceClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeLensWorkspaceClientCapabilitiesStructure >> refreshSupport [
	"Whether the client implementation supports a refresh request sent from the
server to the client.

Note that this event is global and will force the client to refresh all
code lenses currently shown. It should be used with absolute care and is
useful for situation where a server for example detect a project wide
change that requires such a calculation."

	^ data at: 'refreshSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCodeLensWorkspaceClientCapabilitiesStructure >> refreshSupport: anObject [
	data at: 'refreshSupport' put:  (self objectFor: anObject)
]
