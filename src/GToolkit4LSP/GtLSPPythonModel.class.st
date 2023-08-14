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
