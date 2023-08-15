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
