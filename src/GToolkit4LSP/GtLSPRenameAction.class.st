Class {
	#name : #GtLSPRenameAction,
	#superclass : #GtRenameAction,
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #private }
GtLSPRenameAction >> undoChanges [
	self removeAttributes
]

{ #category : #accessing }
GtLSPRenameAction >> updateSource [
	self removeAttributes
]
