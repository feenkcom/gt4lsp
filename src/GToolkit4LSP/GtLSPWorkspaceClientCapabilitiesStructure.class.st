Class {
	#name : #GtLSPWorkspaceClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> applyEdit [
	"The client supports applying batch edits
to the workspace by supporting the request
'workspace/applyEdit'"

	^ data at: 'applyEdit'
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> applyEdit: anObject [
	data at: 'applyEdit' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> codeLens [
	"Capabilities specific to the code lens requests scoped to the
workspace.

@since 3.16.0."

	^ (data at: 'codeLens') ifNotNil: [ :obj | GtLSPCodeLensWorkspaceClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> codeLens: anObject [
	data at: 'codeLens' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> configuration [
	"The client supports `workspace/configuration` requests.

@since 3.6.0"

	^ data at: 'configuration'
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> configuration: anObject [
	data at: 'configuration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> diagnostics [
	"Capabilities specific to the diagnostic requests scoped to the
workspace.

@since 3.17.0."

	^ (data at: 'diagnostics') ifNotNil: [ :obj | GtLSPDiagnosticWorkspaceClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> diagnostics: anObject [
	data at: 'diagnostics' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> didChangeConfiguration [
	"Capabilities specific to the `workspace/didChangeConfiguration` notification."

	^ (data at: 'didChangeConfiguration') ifNotNil: [ :obj | GtLSPDidChangeConfigurationClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> didChangeConfiguration: anObject [
	data at: 'didChangeConfiguration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> didChangeWatchedFiles [
	"Capabilities specific to the `workspace/didChangeWatchedFiles` notification."

	^ (data at: 'didChangeWatchedFiles') ifNotNil: [ :obj | GtLSPDidChangeWatchedFilesClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> didChangeWatchedFiles: anObject [
	data at: 'didChangeWatchedFiles' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> executeCommand [
	"Capabilities specific to the `workspace/executeCommand` request."

	^ (data at: 'executeCommand') ifNotNil: [ :obj | GtLSPExecuteCommandClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> executeCommand: anObject [
	data at: 'executeCommand' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> fileOperations [
	"The client has support for file notifications/requests for user operations on files.

Since 3.16.0"

	^ (data at: 'fileOperations') ifNotNil: [ :obj | GtLSPFileOperationClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> fileOperations: anObject [
	data at: 'fileOperations' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> inlayHint [
	"Capabilities specific to the inlay hint requests scoped to the
workspace.

@since 3.17.0."

	^ (data at: 'inlayHint') ifNotNil: [ :obj | GtLSPInlayHintWorkspaceClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> inlayHint: anObject [
	data at: 'inlayHint' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> inlineValue [
	"Capabilities specific to the inline values requests scoped to the
workspace.

@since 3.17.0."

	^ (data at: 'inlineValue') ifNotNil: [ :obj | GtLSPInlineValueWorkspaceClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> inlineValue: anObject [
	data at: 'inlineValue' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> semanticTokens [
	"Capabilities specific to the semantic token requests scoped to the
workspace.

@since 3.16.0."

	^ (data at: 'semanticTokens') ifNotNil: [ :obj | GtLSPSemanticTokensWorkspaceClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> semanticTokens: anObject [
	data at: 'semanticTokens' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> symbol [
	"Capabilities specific to the `workspace/symbol` request."

	^ (data at: 'symbol') ifNotNil: [ :obj | GtLSPWorkspaceSymbolClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> symbol: anObject [
	data at: 'symbol' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> workspaceEdit [
	"Capabilities specific to `WorkspaceEdit`s."

	^ (data at: 'workspaceEdit') ifNotNil: [ :obj | GtLSPWorkspaceEditClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> workspaceEdit: anObject [
	data at: 'workspaceEdit' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> workspaceFolders [
	"The client has support for workspace folders.

@since 3.6.0"

	^ data at: 'workspaceFolders'
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> workspaceFolders: anObject [
	data at: 'workspaceFolders' put:  (self objectFor: anObject)
]
