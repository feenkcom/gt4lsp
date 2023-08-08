Class {
	#name : #GtLSPRenameAction,
	#superclass : #GtRenameAction,
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #accessing }
GtLSPRenameAction >> lostFocus [
]

{ #category : #accessing }
GtLSPRenameAction >> processReturnFor: renameEditor in: anEditorElement [
	anEditorElement
		allChildrenBreadthFirstDo: [ :each | (each isKindOf: GtRefactoringsPreviewButton) ifTrue: [ ^ each openPreview ] ].
	^ super processReturnFor: renameEditor in: anEditorElement
]

{ #category : #private }
GtLSPRenameAction >> undoChanges [
	self removeAttributes.
	super undoChanges
]

{ #category : #accessing }
GtLSPRenameAction >> updateSource [
	self removeAttributes
]
