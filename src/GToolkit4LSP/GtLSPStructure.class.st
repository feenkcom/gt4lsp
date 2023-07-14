Class {
	#name : #GtLSPStructure,
	#superclass : #Object,
	#instVars : [
		'data'
	],
	#classInstVars : [
		'methodMap'
	],
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #'code generation' }
GtLSPStructure class >> compileAccessors: aDictionary [
	| structureName class properties |
	structureName := aDictionary at: 'name'.
	properties := aDictionary at: 'properties'.
	class := Smalltalk at: ('GtLSP' , structureName , 'Structure') asSymbol.
	properties
		do: [ :each | 
			class compile: (self getterForProperty: each) classified: #accessing.
			class compile: (self setterForProperty: each) classified: #accessing ]
]

{ #category : #'code generation' }
GtLSPStructure class >> compileCreateMethod: aDictionary [
	| properties |
	properties := aDictionary at: 'properties'.
	(((properties reject: [ :each | each at: 'optional' ifAbsent: [ false ] ])
		collect: [ :each | 
			{each at: 'name'.
				self initializerForType: (each at: 'type')} ])
		select: [ :each | each last notNil ])
		ifNotEmpty: [ :variables | 
			| structureName class |
			structureName := aDictionary at: 'name'.
			class := Smalltalk at: ('GtLSP' , structureName , 'Structure') asSymbol.
			class
				compile: (String
						streamContents: [ :stream | 
							stream
								<< 'create';
								cr.
							variables
								do: [ :each | stream << '	data at: ''' << each first << ''' put: ' << each last ]
								separatedBy: [ stream
										<< '.';
										cr ] ])
				classified: #initialization ]
]

{ #category : #'code generation' }
GtLSPStructure class >> compileMethodMapForRequests: requests andNotifications: notifications [
	GtLSPStructure class
		compile: (String
				streamContents: [ :stream | 
					| block |
					stream
						<< 'initialize';
						cr;
						<< '	methodMap := Dictionary new.';
						cr;
						<< '	#(';
						cr.
					block := [ :each | 
						| class params |
						((params := each at: 'params' ifAbsent: [ Dictionary new ])
							at: 'kind'
							ifAbsent: [  ]) = 'reference'
							ifTrue: [ class := Smalltalk
										at: ('GtLSP' , (params at: 'name') , 'Structure') asSymbol
										ifAbsent: [  ].
								class notNil
									ifTrue: [ (stream << '		#(' << (each at: 'method') storeString << ' #' << class name)
											<< ')';
											cr ] ] ].
					requests do: block.
					notifications do: block.
					stream
						<< '	)';
						cr;
						<< '		do: [:each | methodMap at: each first put: each last]' ])
		classified: #'class initialization'.
	GtLSPStructure initialize
]

{ #category : #'code generation' }
GtLSPStructure class >> compileNewClasses [
	| values |
	values := NeoJSONReader
			fromString: (ZnClient new
					get: 'https://raw.githubusercontent.com/microsoft/vscode-languageserver-node/main/protocol/metaModel.json').
	(values at: 'structures')
		do: [ :each | self defineStructure: each ];
		do: [ :each | self compileAccessors: each ];
		do: [ :each | self compileCreateMethod: each ].
	self copyDownMethodsIn: (values at: 'structures').
	self
		compileMethodMapForRequests: (values at: 'requests')
		andNotifications: (values at: 'notifications')
]

{ #category : #'code generation' }
GtLSPStructure class >> converterForType: aDictionary variable: varName optional: aBoolean [
	| refType |
	(aDictionary at: 'kind') = 'reference'
		ifTrue: [ refType := Smalltalk
					at: ('GtLSP' , (aDictionary at: 'name') , 'Structure') asSymbol
					ifAbsent: [  ] ].
	^ (refType ifNil: [ '' ] ifNotNil: [ '(' ]) , 'data at: ''' , varName , ''''
		, (aBoolean ifTrue: [ ' ifAbsent: [ ]' ] ifFalse: [ '' ])
		, (refType
				ifNil: [ '' ]
				ifNotNil: [ ') ifNotNil: [ :obj | ' , refType name asString , ' on: obj ]' ])
]

{ #category : #'code generation' }
GtLSPStructure class >> copyDownMethodsFor: aString in: structures processed: processed [
	| block class definition |
	class := Smalltalk
			at: ('GtLSP' , aString , 'Structure') asSymbol
			ifAbsent: [  ].
	class ifNil: [ ^ nil ].
	definition := structures
			detect: [ :each | (each at: 'name') = aString ]
			ifNone: [  ].
	definition ifNil: [ ^ nil ].
	block := [ :dict | 
		(dict at: 'kind') = 'reference'
			ifTrue: [ (processed
					at: (dict at: 'name')
					ifAbsentPut: [ self
							copyDownMethodsFor: (dict at: 'name')
							in: structures
							processed: processed ])
					ifNotNil: [ :cls | 
						cls selectors
							do: [ :sel | 
								sel = #create
									ifTrue: [ self mergeCreateFrom: cls into: class ]
									ifFalse: [ class compile: (cls sourceCodeAt: sel) classified: #accessing ] ] ] ] ].
	(definition at: 'extends' ifAbsent: [ #() ]) do: block.
	(definition at: 'mixins' ifAbsent: [ #() ]) do: block.
	^ class
]

{ #category : #'code generation' }
GtLSPStructure class >> copyDownMethodsIn: structures [
	structures
		do: [ :each | 
			self
				copyDownMethodsFor: (each at: 'name')
				in: structures
				processed: Dictionary new ]
]

{ #category : #'instance creation' }
GtLSPStructure class >> create [
	^ self new create
]

{ #category : #'code generation' }
GtLSPStructure class >> defineStructure: aDictionary [
	| structureName |
	structureName := aDictionary at: 'name'.
	^ self
		subclass: ('GtLSP' , structureName , 'Structure') asSymbol
		instanceVariableNames: ''
		classVariableNames: ''
		category: self category
]

{ #category : #'code generation' }
GtLSPStructure class >> generateClasses [
	self removeSubclasses.
	self compileNewClasses
]

{ #category : #'code generation' }
GtLSPStructure class >> getterForProperty: aDictionary [
	| varName |
	varName := aDictionary at: 'name'.
	^ String
		streamContents: [ :stream | 
			stream
				<< varName;
				cr.
			aDictionary
				at: 'documentation'
				ifPresent: [ :str | 
					(stream tab << '"' << (str copyReplaceAll: '"' with: '""'))
						<< '"';
						cr;
						cr ].
			stream tab << '^ '
				<< (self
						converterForType: (aDictionary at: 'type')
						variable: varName
						optional: (aDictionary at: 'optional' ifAbsent: [ false ])) ]
]

{ #category : #'class initialization' }
GtLSPStructure class >> initialize [
	methodMap := Dictionary new.
	#(
		#('textDocument/implementation' #GtLSPImplementationParamsStructure)
		#('textDocument/typeDefinition' #GtLSPTypeDefinitionParamsStructure)
		#('workspace/configuration' #GtLSPConfigurationParamsStructure)
		#('textDocument/documentColor' #GtLSPDocumentColorParamsStructure)
		#('textDocument/colorPresentation' #GtLSPColorPresentationParamsStructure)
		#('textDocument/foldingRange' #GtLSPFoldingRangeParamsStructure)
		#('textDocument/declaration' #GtLSPDeclarationParamsStructure)
		#('textDocument/selectionRange' #GtLSPSelectionRangeParamsStructure)
		#('window/workDoneProgress/create' #GtLSPWorkDoneProgressCreateParamsStructure)
		#('textDocument/prepareCallHierarchy' #GtLSPCallHierarchyPrepareParamsStructure)
		#('callHierarchy/incomingCalls' #GtLSPCallHierarchyIncomingCallsParamsStructure)
		#('callHierarchy/outgoingCalls' #GtLSPCallHierarchyOutgoingCallsParamsStructure)
		#('textDocument/semanticTokens/full' #GtLSPSemanticTokensParamsStructure)
		#('textDocument/semanticTokens/full/delta' #GtLSPSemanticTokensDeltaParamsStructure)
		#('textDocument/semanticTokens/range' #GtLSPSemanticTokensRangeParamsStructure)
		#('window/showDocument' #GtLSPShowDocumentParamsStructure)
		#('textDocument/linkedEditingRange' #GtLSPLinkedEditingRangeParamsStructure)
		#('workspace/willCreateFiles' #GtLSPCreateFilesParamsStructure)
		#('workspace/willRenameFiles' #GtLSPRenameFilesParamsStructure)
		#('workspace/willDeleteFiles' #GtLSPDeleteFilesParamsStructure)
		#('textDocument/moniker' #GtLSPMonikerParamsStructure)
		#('textDocument/prepareTypeHierarchy' #GtLSPTypeHierarchyPrepareParamsStructure)
		#('typeHierarchy/supertypes' #GtLSPTypeHierarchySupertypesParamsStructure)
		#('typeHierarchy/subtypes' #GtLSPTypeHierarchySubtypesParamsStructure)
		#('textDocument/inlineValue' #GtLSPInlineValueParamsStructure)
		#('textDocument/inlayHint' #GtLSPInlayHintParamsStructure)
		#('inlayHint/resolve' #GtLSPInlayHintStructure)
		#('textDocument/diagnostic' #GtLSPDocumentDiagnosticParamsStructure)
		#('workspace/diagnostic' #GtLSPWorkspaceDiagnosticParamsStructure)
		#('textDocument/inlineCompletion' #GtLSPInlineCompletionParamsStructure)
		#('client/registerCapability' #GtLSPRegistrationParamsStructure)
		#('client/unregisterCapability' #GtLSPUnregistrationParamsStructure)
		#('initialize' #GtLSPInitializeParamsStructure)
		#('window/showMessageRequest' #GtLSPShowMessageRequestParamsStructure)
		#('textDocument/willSaveWaitUntil' #GtLSPWillSaveTextDocumentParamsStructure)
		#('textDocument/completion' #GtLSPCompletionParamsStructure)
		#('completionItem/resolve' #GtLSPCompletionItemStructure)
		#('textDocument/hover' #GtLSPHoverParamsStructure)
		#('textDocument/signatureHelp' #GtLSPSignatureHelpParamsStructure)
		#('textDocument/definition' #GtLSPDefinitionParamsStructure)
		#('textDocument/references' #GtLSPReferenceParamsStructure)
		#('textDocument/documentHighlight' #GtLSPDocumentHighlightParamsStructure)
		#('textDocument/documentSymbol' #GtLSPDocumentSymbolParamsStructure)
		#('textDocument/codeAction' #GtLSPCodeActionParamsStructure)
		#('codeAction/resolve' #GtLSPCodeActionStructure)
		#('workspace/symbol' #GtLSPWorkspaceSymbolParamsStructure)
		#('workspaceSymbol/resolve' #GtLSPWorkspaceSymbolStructure)
		#('textDocument/codeLens' #GtLSPCodeLensParamsStructure)
		#('codeLens/resolve' #GtLSPCodeLensStructure)
		#('textDocument/documentLink' #GtLSPDocumentLinkParamsStructure)
		#('documentLink/resolve' #GtLSPDocumentLinkStructure)
		#('textDocument/formatting' #GtLSPDocumentFormattingParamsStructure)
		#('textDocument/rangeFormatting' #GtLSPDocumentRangeFormattingParamsStructure)
		#('textDocument/rangesFormatting' #GtLSPDocumentRangesFormattingParamsStructure)
		#('textDocument/onTypeFormatting' #GtLSPDocumentOnTypeFormattingParamsStructure)
		#('textDocument/rename' #GtLSPRenameParamsStructure)
		#('textDocument/prepareRename' #GtLSPPrepareRenameParamsStructure)
		#('workspace/executeCommand' #GtLSPExecuteCommandParamsStructure)
		#('workspace/applyEdit' #GtLSPApplyWorkspaceEditParamsStructure)
		#('workspace/didChangeWorkspaceFolders' #GtLSPDidChangeWorkspaceFoldersParamsStructure)
		#('window/workDoneProgress/cancel' #GtLSPWorkDoneProgressCancelParamsStructure)
		#('workspace/didCreateFiles' #GtLSPCreateFilesParamsStructure)
		#('workspace/didRenameFiles' #GtLSPRenameFilesParamsStructure)
		#('workspace/didDeleteFiles' #GtLSPDeleteFilesParamsStructure)
		#('notebookDocument/didOpen' #GtLSPDidOpenNotebookDocumentParamsStructure)
		#('notebookDocument/didChange' #GtLSPDidChangeNotebookDocumentParamsStructure)
		#('notebookDocument/didSave' #GtLSPDidSaveNotebookDocumentParamsStructure)
		#('notebookDocument/didClose' #GtLSPDidCloseNotebookDocumentParamsStructure)
		#('initialized' #GtLSPInitializedParamsStructure)
		#('workspace/didChangeConfiguration' #GtLSPDidChangeConfigurationParamsStructure)
		#('window/showMessage' #GtLSPShowMessageParamsStructure)
		#('window/logMessage' #GtLSPLogMessageParamsStructure)
		#('textDocument/didOpen' #GtLSPDidOpenTextDocumentParamsStructure)
		#('textDocument/didChange' #GtLSPDidChangeTextDocumentParamsStructure)
		#('textDocument/didClose' #GtLSPDidCloseTextDocumentParamsStructure)
		#('textDocument/didSave' #GtLSPDidSaveTextDocumentParamsStructure)
		#('textDocument/willSave' #GtLSPWillSaveTextDocumentParamsStructure)
		#('workspace/didChangeWatchedFiles' #GtLSPDidChangeWatchedFilesParamsStructure)
		#('textDocument/publishDiagnostics' #GtLSPPublishDiagnosticsParamsStructure)
		#('$/setTrace' #GtLSPSetTraceParamsStructure)
		#('$/logTrace' #GtLSPLogTraceParamsStructure)
		#('$/cancelRequest' #GtLSPCancelParamsStructure)
		#('$/progress' #GtLSPProgressParamsStructure)
	)
		do: [:each | methodMap at: each first put: each last]
]

{ #category : #'code generation' }
GtLSPStructure class >> initializerForType: aDictionary [
	| kind structureName className |
	kind := aDictionary at: 'kind'.
	kind = 'array' ifTrue: [ ^ '#()' ].
	kind = 'reference' ifFalse: [ ^ nil ].
	structureName := aDictionary at: 'name'.
	className := ('GtLSP' , structureName , 'Structure') asSymbol.
	^ (Smalltalk at: className ifAbsent: [  ])
		ifNotNil: [ :cls | ^ cls name asString , ' create  asDictionary' ]
]

{ #category : #'code generation' }
GtLSPStructure class >> mergeCreateFrom: cls into: class [
	| clsStatements classStatements allStatements |
	clsStatements := (cls >> #create) ast body statements collect: #formattedCode.
	classStatements := (class includesSelector: #create)
			ifTrue: [ (class >> #create) ast body statements collect: #formattedCode ]
			ifFalse: [ #() ].
	allStatements := (OrderedCollection withAll: clsStatements)
			addAll: classStatements;
			yourself.
	class
		compile: (String
				streamContents: [ :stream | 
					stream
						<< 'create';
						cr.
					allStatements
						do: [ :each | stream << '	' << (each copyReplaceAll: String cr with: String cr , '	') ]
						separatedBy: [ stream
								<< '.';
								cr ] ])
		classified: #initialization
]

{ #category : #'instance creation' }
GtLSPStructure class >> on: aDictionary [
	^ self new
		setData: aDictionary;
		yourself
]

{ #category : #'code generation' }
GtLSPStructure class >> removeSubclasses [
	self subclasses do: [ :each | each removeFromSystem ]
]

{ #category : #'code generation' }
GtLSPStructure class >> setterForProperty: aDictionary [
	| varName |
	varName := aDictionary at: 'name'.
	^ String
		streamContents: [ :stream | 
			(stream << varName)
				<< ': anObject';
				cr.
			stream tab << 'data at: ''' << varName << ''' put:  (self objectFor: anObject)' ]
]

{ #category : #accessing }
GtLSPStructure class >> structureForMethod: aString [
	^ (Smalltalk
		at: (methodMap at: aString ifAbsent: [ '' ]) asSymbol
		ifAbsent: [  ]) ifNil: [ GtLSPStructure ] ifNotNil: [ :class | class ]
]

{ #category : #accessing }
GtLSPStructure >> asDictionary [
	^ data
]

{ #category : #accessing }
GtLSPStructure >> asJson [
	^ data asJson
]

{ #category : #accessing }
GtLSPStructure >> at: aString [
	^ data at: aString
]

{ #category : #accessing }
GtLSPStructure >> create [
	
]

{ #category : #accessing }
GtLSPStructure >> gtTreeFor: aView [
	<gtView>
	^ aView columnedTree
		title: 'Data';
		items: [ {{'self'.
					self}} ];
		children: [ :each | 
			(each last isKindOf: GtLSPStructure)
				ifTrue: [ (each last class selectors
						select: [ :sel | sel isUnary and: [ sel ~= #create ] ])
						collect: [ :sel | 
							{sel.
								each last perform: sel} ] ]
				ifFalse: [ #() ] ];
		column: 'Name' text: [ :each | each first ];
		column: 'Value' text: [ :each | each last gtDisplayString ];
		send: [ :each | each last ]
]

{ #category : #initialization }
GtLSPStructure >> initialize [
	super initialize.
	data := Dictionary new
]

{ #category : #private }
GtLSPStructure >> objectFor: anObject [
	(anObject isKindOf: GtLSPStructure) ifTrue: [ ^ anObject asDictionary ].
	^ anObject
]

{ #category : #accessing }
GtLSPStructure >> setData: aDictionary [
	data := aDictionary
]
