Class {
	#name : #GtLSPTypeScriptModel,
	#superclass : #GtLSPDirectoryModel,
	#category : #'GToolkit4LSP-Model-TS'
}

{ #category : #accessing }
GtLSPTypeScriptModel class >> extensions [
	^ '*.js;*.ts;*.jsx;*.tsx'
]

{ #category : #'class initialization' }
GtLSPTypeScriptModel class >> initialize [
	self initializeTypescriptLanguageServer
]

{ #category : #'class initialization' }
GtLSPTypeScriptModel class >> initializeTypescriptLanguageServer [
	"https://github.com/typescript-language-server/typescript-language-server"

	"npm install -g typescript-language-server typescript"

	self
		executable: (Smalltalk os isWindows
				ifTrue: [ 'typescript-language-server.cmd' ]
				ifFalse: [ 'typescript-language-server' ]).
	self arguments: #('--stdio')
]

{ #category : #accessing }
GtLSPTypeScriptModel class >> languageType [
	^ 'typescript'
]

{ #category : #accessing }
GtLSPTypeScriptModel class >> styler [
	^ TypeScriptParser gtStyler
]

{ #category : #accessing }
GtLSPTypeScriptModel >> diffSplitter [
	^ GtSmaCCDiffSplitter new scannerClass: JSScanner
]

{ #category : #search }
GtLSPTypeScriptModel >> gtClassSearch: aSearch [
	<gtSearch>
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Class') value.
	^ aSearch list
		priority: 10;
		title: 'Classes';
		items: [ self allSymbolsStream select: [ :each | each kind = kind ] ];
		itemName: [ :item | item symbolName ];
		wantsToDisplayOnEmptyQuery: false;
		filterBySubstring
]

{ #category : #search }
GtLSPTypeScriptModel >> gtFunctionSearch: aSearch [
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

{ #category : #search }
GtLSPTypeScriptModel >> gtVariableSearch: aSearch [
	<gtSearch>
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Variable') value.
	^ aSearch list
		priority: 13;
		title: 'Variables';
		items: [ self allSymbolsStream select: [ :each | each kind = kind ] ];
		itemName: [ :item | item symbolName ];
		wantsToDisplayOnEmptyQuery: false;
		filterBySubstring
]
