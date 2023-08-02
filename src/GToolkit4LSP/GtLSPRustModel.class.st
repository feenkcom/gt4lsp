Class {
	#name : #GtLSPRustModel,
	#superclass : #GtLSPDirectoryModel,
	#category : #'GToolkit4LSP-Model-Rust'
}

{ #category : #accessing }
GtLSPRustModel class >> downloadExecutable [
	| downloadFile programName tags downloaded executableFile |
	downloadFile := 'rust-analyzer-' , Smalltalk vm architectureName
			, (Smalltalk os isMacOS
					ifTrue: [ '-apple-darwin.gz' ]
					ifFalse: [ Smalltalk os isWindows
							ifTrue: [ '-pc-windows-msvc.gz' ]
							ifFalse: [ '-unknown-linux-gnu.gz' ] ]).
	programName := 'rust-analyzer'
			, (Smalltalk os isWindows ifTrue: [ '.exe' ] ifFalse: [ '' ]).
	executableFile := '.' asFileReference / programName.
	executableFile exists ifTrue: [ ^ self executable: executableFile pathString ].
	downloaded := (executableFile pathString , '.gz') asFileReference.
	tags := GtJson
			forJsonString: (ZnClient new url: 'https://api.github.com/repos/rust-lang/rust-analyzer/tags')
					get.
	((tags collect: [ :each | each name jsonObject ])
		asSortedCollection: [ :a :b | a > b ])
		detect: [ :each | 
			[ Date fromString: each.
			downloaded ensureDelete.
			ZnOptions globalDefault clone
				at: #queryKeyValueSafeSet put: ZnOptions queryKeyValueSafeSet \ '/;';
				during: [ ('https://github.com/rust-lang/rust-analyzer/releases/download/' , each , '/'
						, downloadFile) asUrl saveContentsToFile: downloaded.
					true ] ] on: Error do: [ :ex | ex return: false ] ].
	GZipReadStream unzip: downloaded.
	downloaded ensureDelete.
	Smalltalk os isWindows
		ifFalse: [ GtSubprocessWithInMemoryOutput new
				shellCommand: (String
						streamContents: [ :stream | stream << 'chmod +x "' << executableFile pathString << '"' ]);
				runAndWait ].
	self executable: executableFile pathString
]

{ #category : #accessing }
GtLSPRustModel class >> extensions [
	^ '*.rs'
]

{ #category : #accessing }
GtLSPRustModel class >> languageType [
	^ 'rust'
]

{ #category : #accessing }
GtLSPRustModel class >> styler [
	^ RustParser gtStyler
]

{ #category : #accessing }
GtLSPRustModel >> allSymbolsStream [
	^ self files asAsyncStream flatCollect: [ :each | each symbolStream ]
]

{ #category : #accessing }
GtLSPRustModel >> build [
	| process |
	process := GtSubprocessWithInMemoryOutput new.
	process command: 'cargo'.
	process addArgument: 'build'.
	process workingDirectory: self filename.
	process runAndWait.
	process exitCode ~= 0 ifTrue: [ self inform: process stderr ]
]

{ #category : #accessing }
GtLSPRustModel >> diffSplitter [
	^ GtSmaCCDiffSplitter new scannerClass: RustScanner
]

{ #category : #accessing }
GtLSPRustModel >> diffStyler [
	^ RustParser gtStyler
]

{ #category : #accessing }
GtLSPRustModel >> gtFieldSearch: aSearch [
	<gtSearch>
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Field') value.
	^ aSearch list
		priority: 13;
		title: 'Fields';
		items: [ self allSymbolsStream select: [ :each | each kind = kind ] ];
		itemName: [ :item | item symbolName ];
		wantsToDisplayOnEmptyQuery: false;
		filterBySubstring
]

{ #category : #accessing }
GtLSPRustModel >> gtFunctionSearch: aSearch [
	<gtSearch>
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Function') value.
	^ aSearch list
		priority: 12;
		title: 'Functions';
		items: [ self allSymbolsStream select: [ :each | each kind = kind ] ];
		itemName: [ :item | item symbolName ];
		wantsToDisplayOnEmptyQuery: false;
		filterBySubstring
]

{ #category : #accessing }
GtLSPRustModel >> gtLSPBuildAction [
	<gtLSPToolbarAction>
	^ GtLSPCoderAction new
		id: #buildAction;
		action: [ :button | 
			button disable.
			[ [ self build ] ensure: [ button inUIProcessDo: [ button enable ] ] ] fork ];
		title: 'Build';
		icon: BrGlamorousVectorIcons rustLogo;
		order: 20
]

{ #category : #accessing }
GtLSPRustModel >> gtStructureSearch: aSearch [
	<gtSearch>
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Struct') value.
	^ aSearch list
		priority: 11;
		title: 'Structures';
		items: [ self allSymbolsStream select: [ :each | each kind = kind ] ];
		itemName: [ :item | item symbolName ];
		wantsToDisplayOnEmptyQuery: false;
		filterBySubstring
]

{ #category : #private }
GtLSPRustModel >> installMessageHandlers [
	lspClient
		on: 'textDocument/publishDiagnostics'
		as: GtLSPPublishDiagnosticsParamsStructure
		send: #publishDiagnostics:
		to: self
]

{ #category : #private }
GtLSPRustModel >> publishDiagnostics: each [
	(self fileForUri: each uri)
		ifNotNil: [ :file | file diagnostics: each diagnostics ]
]
