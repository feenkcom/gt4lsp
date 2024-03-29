Class {
	#name : #GtLSPServerCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> callHierarchyProvider [
	"The server provides call hierarchy support.

@since 3.16.0"

	^ data at: 'callHierarchyProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> callHierarchyProvider: anObject [
	data at: 'callHierarchyProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> codeActionProvider [
	"The server provides code actions. CodeActionOptions may only be
specified if the client states that it supports
`codeActionLiteralSupport` in its initial `initialize` request."

	^ data at: 'codeActionProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> codeActionProvider: anObject [
	data at: 'codeActionProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> codeLensProvider [
	"The server provides code lens."

	^ (data at: 'codeLensProvider' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCodeLensOptionsStructure on: obj ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> codeLensProvider: anObject [
	data at: 'codeLensProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> colorProvider [
	"The server provides color provider support."

	^ data at: 'colorProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> colorProvider: anObject [
	data at: 'colorProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> completionProvider [
	"The server provides completion support."

	^ (data at: 'completionProvider' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCompletionOptionsStructure on: obj ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> completionProvider: anObject [
	data at: 'completionProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> declarationProvider [
	"The server provides Goto Declaration support."

	^ data at: 'declarationProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> declarationProvider: anObject [
	data at: 'declarationProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> definitionProvider [
	"The server provides goto definition support."

	^ data at: 'definitionProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> definitionProvider: anObject [
	data at: 'definitionProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> diagnosticProvider [
	"The server has support for pull model diagnostics.

@since 3.17.0"

	^ data at: 'diagnosticProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> diagnosticProvider: anObject [
	data at: 'diagnosticProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentFormattingProvider [
	"The server provides document formatting."

	^ data at: 'documentFormattingProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentFormattingProvider: anObject [
	data at: 'documentFormattingProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentHighlightProvider [
	"The server provides document highlight support."

	^ data at: 'documentHighlightProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentHighlightProvider: anObject [
	data at: 'documentHighlightProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentLinkProvider [
	"The server provides document link support."

	^ (data at: 'documentLinkProvider' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDocumentLinkOptionsStructure on: obj ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentLinkProvider: anObject [
	data at: 'documentLinkProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentOnTypeFormattingProvider [
	"The server provides document formatting on typing."

	^ (data at: 'documentOnTypeFormattingProvider' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDocumentOnTypeFormattingOptionsStructure on: obj ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentOnTypeFormattingProvider: anObject [
	data at: 'documentOnTypeFormattingProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentRangeFormattingProvider [
	"The server provides document range formatting."

	^ data at: 'documentRangeFormattingProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentRangeFormattingProvider: anObject [
	data at: 'documentRangeFormattingProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentSymbolProvider [
	"The server provides document symbol support."

	^ data at: 'documentSymbolProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> documentSymbolProvider: anObject [
	data at: 'documentSymbolProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> executeCommandProvider [
	"The server provides execute command support."

	^ (data at: 'executeCommandProvider' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPExecuteCommandOptionsStructure on: obj ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> executeCommandProvider: anObject [
	data at: 'executeCommandProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> experimental [
	"Experimental server capabilities."

	^ data at: 'experimental' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> experimental: anObject [
	data at: 'experimental' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> foldingRangeProvider [
	"The server provides folding provider support."

	^ data at: 'foldingRangeProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> foldingRangeProvider: anObject [
	data at: 'foldingRangeProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> hoverProvider [
	"The server provides hover support."

	^ data at: 'hoverProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> hoverProvider: anObject [
	data at: 'hoverProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> implementationProvider [
	"The server provides Goto Implementation support."

	^ data at: 'implementationProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> implementationProvider: anObject [
	data at: 'implementationProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> inlayHintProvider [
	"The server provides inlay hints.

@since 3.17.0"

	^ data at: 'inlayHintProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> inlayHintProvider: anObject [
	data at: 'inlayHintProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> inlineCompletionProvider [
	"Inline completion options used during static registration.

@since 3.18.0
@proposed"

	^ data at: 'inlineCompletionProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> inlineCompletionProvider: anObject [
	data at: 'inlineCompletionProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> inlineValueProvider [
	"The server provides inline values.

@since 3.17.0"

	^ data at: 'inlineValueProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> inlineValueProvider: anObject [
	data at: 'inlineValueProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> linkedEditingRangeProvider [
	"The server provides linked editing range support.

@since 3.16.0"

	^ data at: 'linkedEditingRangeProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> linkedEditingRangeProvider: anObject [
	data at: 'linkedEditingRangeProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> monikerProvider [
	"The server provides moniker support.

@since 3.16.0"

	^ data at: 'monikerProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> monikerProvider: anObject [
	data at: 'monikerProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> notebookDocumentSync [
	"Defines how notebook documents are synced.

@since 3.17.0"

	^ data at: 'notebookDocumentSync' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> notebookDocumentSync: anObject [
	data at: 'notebookDocumentSync' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> positionEncoding [
	"The position encoding the server picked from the encodings offered
by the client via the client capability `general.positionEncodings`.

If the client didn't provide any position encodings the only valid
value that a server can return is 'utf-16'.

If omitted it defaults to 'utf-16'.

@since 3.17.0"

	^ data at: 'positionEncoding' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> positionEncoding: anObject [
	data at: 'positionEncoding' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> referencesProvider [
	"The server provides find references support."

	^ data at: 'referencesProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> referencesProvider: anObject [
	data at: 'referencesProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> renameProvider [
	"The server provides rename support. RenameOptions may only be
specified if the client states that it supports
`prepareSupport` in its initial `initialize` request."

	^ data at: 'renameProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> renameProvider: anObject [
	data at: 'renameProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> selectionRangeProvider [
	"The server provides selection range support."

	^ data at: 'selectionRangeProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> selectionRangeProvider: anObject [
	data at: 'selectionRangeProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> semanticTokensProvider [
	"The server provides semantic tokens support.

@since 3.16.0"

	^ data at: 'semanticTokensProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> semanticTokensProvider: anObject [
	data at: 'semanticTokensProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> signatureHelpProvider [
	"The server provides signature help support."

	^ (data at: 'signatureHelpProvider' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPSignatureHelpOptionsStructure on: obj ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> signatureHelpProvider: anObject [
	data at: 'signatureHelpProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> textDocumentSync [
	"Defines how text documents are synced. Is either a detailed structure
defining each notification or for backwards compatibility the
TextDocumentSyncKind number."

	^ data at: 'textDocumentSync' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> textDocumentSync: anObject [
	data at: 'textDocumentSync' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> typeDefinitionProvider [
	"The server provides Goto Type Definition support."

	^ data at: 'typeDefinitionProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> typeDefinitionProvider: anObject [
	data at: 'typeDefinitionProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> typeHierarchyProvider [
	"The server provides type hierarchy support.

@since 3.17.0"

	^ data at: 'typeHierarchyProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> typeHierarchyProvider: anObject [
	data at: 'typeHierarchyProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> workspace [
	"Workspace specific server capabilities."

	^ data at: 'workspace' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> workspace: anObject [
	data at: 'workspace' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> workspaceSymbolProvider [
	"The server provides workspace symbol support."

	^ data at: 'workspaceSymbolProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPServerCapabilitiesStructure >> workspaceSymbolProvider: anObject [
	data at: 'workspaceSymbolProvider' put:  (self objectFor: anObject)
]
