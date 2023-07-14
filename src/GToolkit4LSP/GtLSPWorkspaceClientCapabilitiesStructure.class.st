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

	^ data at: 'applyEdit' ifAbsent: [ ]
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

	^ (data at: 'codeLens' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCodeLensWorkspaceClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> codeLens: anObject [
	data at: 'codeLens' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> configuration [
	"The client supports `workspace/configuration` requests.

@since 3.6.0"

	^ data at: 'configuration' ifAbsent: [ ]
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

	^ (data at: 'diagnostics' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDiagnosticWorkspaceClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> diagnostics: anObject [
	data at: 'diagnostics' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> didChangeConfiguration [
	"Capabilities specific to the `workspace/didChangeConfiguration` notification."

	^ (data at: 'didChangeConfiguration' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDidChangeConfigurationClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> didChangeConfiguration: anObject [
	data at: 'didChangeConfiguration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> didChangeWatchedFiles [
	"Capabilities specific to the `workspace/didChangeWatchedFiles` notification."

	^ (data at: 'didChangeWatchedFiles' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDidChangeWatchedFilesClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> didChangeWatchedFiles: anObject [
	data at: 'didChangeWatchedFiles' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> executeCommand [
	"Capabilities specific to the `workspace/executeCommand` request."

	^ (data at: 'executeCommand' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPExecuteCommandClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> executeCommand: anObject [
	data at: 'executeCommand' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> fileOperations [
	"The client has support for file notifications/requests for user operations on files.

Since 3.16.0"

	^ (data at: 'fileOperations' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPFileOperationClientCapabilitiesStructure on: obj ]
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

	^ (data at: 'inlayHint' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPInlayHintWorkspaceClientCapabilitiesStructure on: obj ]
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

	^ (data at: 'inlineValue' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPInlineValueWorkspaceClientCapabilitiesStructure on: obj ]
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

	^ (data at: 'semanticTokens' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPSemanticTokensWorkspaceClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> semanticTokens: anObject [
	data at: 'semanticTokens' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> symbol [
	"Capabilities specific to the `workspace/symbol` request."

	^ (data at: 'symbol' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPWorkspaceSymbolClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> symbol: anObject [
	data at: 'symbol' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> workspaceEdit [
	"Capabilities specific to `WorkspaceEdit`s."

	^ (data at: 'workspaceEdit' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPWorkspaceEditClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> workspaceEdit: anObject [
	data at: 'workspaceEdit' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> workspaceFolders [
	"The client has support for workspace folders.

@since 3.6.0"

	^ data at: 'workspaceFolders' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceClientCapabilitiesStructure >> workspaceFolders: anObject [
	data at: 'workspaceFolders' put:  (self objectFor: anObject)
]
