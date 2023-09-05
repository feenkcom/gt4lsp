Class {
	#name : #GtLSPPythonModel,
	#superclass : #GtLSPDirectoryModel,
	#category : #'GToolkit4LSP-Model-Pyton'
}

{ #category : #'class initialization' }
GtLSPPythonModel class >> extensions [
	^ '*.py'
]

{ #category : #'class initialization' }
GtLSPPythonModel class >> initialize [
	self initializePyright
]

{ #category : #'class initialization' }
GtLSPPythonModel class >> initializePyright [
	"https://github.com/microsoft/pyright"

	"npm install -g pyright"

	self executable: 'pyright-langserver'.
	self arguments: #('--stdio')
]

{ #category : #'class initialization' }
GtLSPPythonModel class >> initializePythonLSPServer [
	"https://github.com/python-lsp/python-lsp-server"

	"pip install python-lsp-server"

	self executable: 'pylsp'.
	self arguments: #()
]

{ #category : #accessing }
GtLSPPythonModel class >> languageType [
	^ 'python'
]

{ #category : #accessing }
GtLSPPythonModel class >> styler [
	^ PythonParser gtStyler
]

{ #category : #accessing }
GtLSPPythonModel >> diffSplitter [
	^ GtSmaCCDiffSplitter new scannerClass: PythonScanner
]

{ #category : #accessing }
GtLSPPythonModel >> gtClassSearch: aSearch [
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

{ #category : #accessing }
GtLSPPythonModel >> gtFunctionSearch: aSearch [
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
GtLSPPythonModel >> gtMethodSearch: aSearch [
	<gtSearch>
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Method') value.
	^ aSearch list
		priority: 11;
		title: 'Methods';
		items: [ self allSymbolsStream select: [ :each | each kind = kind ] ];
		itemName: [ :item | item symbolName ];
		wantsToDisplayOnEmptyQuery: false;
		filterBySubstring
]

{ #category : #accessing }
GtLSPPythonModel >> gtVariableSearch: aSearch [
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
