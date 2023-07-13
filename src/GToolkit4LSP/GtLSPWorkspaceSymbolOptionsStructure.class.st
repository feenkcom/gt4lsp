Class {
	#name : #GtLSPWorkspaceSymbolOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceSymbolOptionsStructure >> resolveProvider [
	"The server provides support to resolve additional
information for a workspace symbol.

@since 3.17.0"

	^ data at: 'resolveProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceSymbolOptionsStructure >> resolveProvider: anObject [
	data at: 'resolveProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceSymbolOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceSymbolOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
