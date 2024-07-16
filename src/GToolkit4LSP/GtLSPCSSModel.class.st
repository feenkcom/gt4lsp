Class {
	#name : #GtLSPCSSModel,
	#superclass : #GtLSPDirectoryModel,
	#category : #'GToolkit4LSP-Model-CSS'
}

{ #category : #accessing }
GtLSPCSSModel class >> extensions [
	^ '*.css'
]

{ #category : #accessing }
GtLSPCSSModel class >> initialize [
	"https://github.com/vscode-langservers/vscode-css-languageserver-bin"

	"npm install --global vscode-css-languageserver-bin"

	self
		executable: (Smalltalk os isWindows
				ifTrue: [ 'css-languageserver.cmd' ]
				ifFalse: [ 'css-languageserver' ]).
	self arguments: #('--stdio')
]

{ #category : #accessing }
GtLSPCSSModel class >> languageType [
	^ 'css'
]

{ #category : #accessing }
GtLSPCSSModel class >> styler [
	^ CSSParser gtStyler
]

{ #category : #accessing }
GtLSPCSSModel >> diffSplitter [
	^ GtSmaCCDiffSplitter new scannerClass: CSSScanner
]
