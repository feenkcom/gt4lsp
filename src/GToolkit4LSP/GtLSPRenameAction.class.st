Class {
	#name : #GtLSPRenameAction,
	#superclass : #GtRenameAction,
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #private }
GtLSPRenameAction >> undoChanges [
	self removeAttributes
]

{ #category : #private }
GtLSPRenameAction >> updateSource [
	self removeAttributes
]
