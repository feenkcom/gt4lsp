Class {
	#name : #GtLSPEditor,
	#superclass : #BrEditor,
	#category : #'GToolkit4LSP-Editor'
}

{ #category : #accessing }
GtLSPEditor >> defaultTextEditorModel [
	^ GtLSPEditorModel withEditorMode: self defaultTextEditorMode
]
