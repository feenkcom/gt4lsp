Class {
	#name : #GtLSPTextDocumentClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> callHierarchy [
	"Capabilities specific to the various call hierarchy requests.

@since 3.16.0"

	^ (data at: 'callHierarchy' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCallHierarchyClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> callHierarchy: anObject [
	data at: 'callHierarchy' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> codeAction [
	"Capabilities specific to the `textDocument/codeAction` request."

	^ (data at: 'codeAction' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCodeActionClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> codeAction: anObject [
	data at: 'codeAction' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> codeLens [
	"Capabilities specific to the `textDocument/codeLens` request."

	^ (data at: 'codeLens' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCodeLensClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> codeLens: anObject [
	data at: 'codeLens' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> colorProvider [
	"Capabilities specific to the `textDocument/documentColor` and the
`textDocument/colorPresentation` request.

@since 3.6.0"

	^ (data at: 'colorProvider' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDocumentColorClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> colorProvider: anObject [
	data at: 'colorProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> completion [
	"Capabilities specific to the `textDocument/completion` request."

	^ (data at: 'completion' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCompletionClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> completion: anObject [
	data at: 'completion' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> declaration [
	"Capabilities specific to the `textDocument/declaration` request.

@since 3.14.0"

	^ (data at: 'declaration' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDeclarationClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> declaration: anObject [
	data at: 'declaration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> definition [
	"Capabilities specific to the `textDocument/definition` request."

	^ (data at: 'definition' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDefinitionClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> definition: anObject [
	data at: 'definition' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> diagnostic [
	"Capabilities specific to the diagnostic pull model.

@since 3.17.0"

	^ (data at: 'diagnostic' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDiagnosticClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> diagnostic: anObject [
	data at: 'diagnostic' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> documentHighlight [
	"Capabilities specific to the `textDocument/documentHighlight` request."

	^ (data at: 'documentHighlight' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDocumentHighlightClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> documentHighlight: anObject [
	data at: 'documentHighlight' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> documentLink [
	"Capabilities specific to the `textDocument/documentLink` request."

	^ (data at: 'documentLink' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDocumentLinkClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> documentLink: anObject [
	data at: 'documentLink' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> documentSymbol [
	"Capabilities specific to the `textDocument/documentSymbol` request."

	^ (data at: 'documentSymbol' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDocumentSymbolClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> documentSymbol: anObject [
	data at: 'documentSymbol' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> foldingRange [
	"Capabilities specific to the `textDocument/foldingRange` request.

@since 3.10.0"

	^ (data at: 'foldingRange' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPFoldingRangeClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> foldingRange: anObject [
	data at: 'foldingRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> formatting [
	"Capabilities specific to the `textDocument/formatting` request."

	^ (data at: 'formatting' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDocumentFormattingClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> formatting: anObject [
	data at: 'formatting' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> hover [
	"Capabilities specific to the `textDocument/hover` request."

	^ (data at: 'hover' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPHoverClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> hover: anObject [
	data at: 'hover' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> implementation [
	"Capabilities specific to the `textDocument/implementation` request.

@since 3.6.0"

	^ (data at: 'implementation' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPImplementationClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> implementation: anObject [
	data at: 'implementation' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> inlayHint [
	"Capabilities specific to the `textDocument/inlayHint` request.

@since 3.17.0"

	^ (data at: 'inlayHint' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPInlayHintClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> inlayHint: anObject [
	data at: 'inlayHint' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> inlineCompletion [
	"Client capabilities specific to inline completions.

@since 3.18.0
@proposed"

	^ (data at: 'inlineCompletion' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPInlineCompletionClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> inlineCompletion: anObject [
	data at: 'inlineCompletion' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> inlineValue [
	"Capabilities specific to the `textDocument/inlineValue` request.

@since 3.17.0"

	^ (data at: 'inlineValue' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPInlineValueClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> inlineValue: anObject [
	data at: 'inlineValue' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> linkedEditingRange [
	"Capabilities specific to the `textDocument/linkedEditingRange` request.

@since 3.16.0"

	^ (data at: 'linkedEditingRange' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPLinkedEditingRangeClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> linkedEditingRange: anObject [
	data at: 'linkedEditingRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> moniker [
	"Client capabilities specific to the `textDocument/moniker` request.

@since 3.16.0"

	^ (data at: 'moniker' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPMonikerClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> moniker: anObject [
	data at: 'moniker' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> onTypeFormatting [
	"Capabilities specific to the `textDocument/onTypeFormatting` request."

	^ (data at: 'onTypeFormatting' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDocumentOnTypeFormattingClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> onTypeFormatting: anObject [
	data at: 'onTypeFormatting' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> publishDiagnostics [
	"Capabilities specific to the `textDocument/publishDiagnostics` notification."

	^ (data at: 'publishDiagnostics' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPPublishDiagnosticsClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> publishDiagnostics: anObject [
	data at: 'publishDiagnostics' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> rangeFormatting [
	"Capabilities specific to the `textDocument/rangeFormatting` request."

	^ (data at: 'rangeFormatting' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPDocumentRangeFormattingClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> rangeFormatting: anObject [
	data at: 'rangeFormatting' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> references [
	"Capabilities specific to the `textDocument/references` request."

	^ (data at: 'references' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPReferenceClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> references: anObject [
	data at: 'references' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> rename [
	"Capabilities specific to the `textDocument/rename` request."

	^ (data at: 'rename' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPRenameClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> rename: anObject [
	data at: 'rename' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> selectionRange [
	"Capabilities specific to the `textDocument/selectionRange` request.

@since 3.15.0"

	^ (data at: 'selectionRange' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPSelectionRangeClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> selectionRange: anObject [
	data at: 'selectionRange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> semanticTokens [
	"Capabilities specific to the various semantic token request.

@since 3.16.0"

	^ (data at: 'semanticTokens' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPSemanticTokensClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> semanticTokens: anObject [
	data at: 'semanticTokens' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> signatureHelp [
	"Capabilities specific to the `textDocument/signatureHelp` request."

	^ (data at: 'signatureHelp' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPSignatureHelpClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> signatureHelp: anObject [
	data at: 'signatureHelp' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> synchronization [
	"Defines which synchronization capabilities the client supports."

	^ (data at: 'synchronization' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPTextDocumentSyncClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> synchronization: anObject [
	data at: 'synchronization' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> typeDefinition [
	"Capabilities specific to the `textDocument/typeDefinition` request.

@since 3.6.0"

	^ (data at: 'typeDefinition' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPTypeDefinitionClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> typeDefinition: anObject [
	data at: 'typeDefinition' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> typeHierarchy [
	"Capabilities specific to the various type hierarchy requests.

@since 3.17.0"

	^ (data at: 'typeHierarchy' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPTypeHierarchyClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTextDocumentClientCapabilitiesStructure >> typeHierarchy: anObject [
	data at: 'typeHierarchy' put:  (self objectFor: anObject)
]
