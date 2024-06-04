Class {
	#name : #GtLSPPythonSnippetModel,
	#superclass : #GtLSPPythonModel,
	#category : #'GToolkit4LSP-Model-Python'
}

{ #category : #accessing }
GtLSPPythonSnippetModel >> createSnippet [
	| fileName |
	fileName := UUID new printString , PythonParser fileExtension.
	^ self createFile: fileName
]
