Class {
	#name : #GtLSPRenameRefactoringController,
	#superclass : #GtLSPRefactoringController,
	#instVars : [
		'position',
		'lspFile',
		'locations',
		'renameAction'
	],
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #accessing }
GtLSPRenameRefactoringController >> addRefactoringPreview [
	| refactoring |
	self removeRefactoringAttribute.
	refactoring := self refactoring.
	editor editor text
		attribute: (GtRefactoringChangesAttribute new
				refactoring: refactoring;
				completionAction: [ self cleanUp ];
				cancelAction: [ self cancelRefactoring ];
				showWhenCreated: false)
		from: locations first last
		to: locations first last
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> cancelRefactoring [
	self cleanUp.
	super cancelRefactoring
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> cleanUp [
	editor inUIProcessDo: [ renameAction ifNotNil: [ renameAction uninstall ] ].
	super cleanUp
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> installRenameAction: intervals [
	locations := self locationsForRanges: intervals.
	renameAction := GtLSPRenameAction locations: locations element: editor.
	renameAction selectAll: true.
	renameAction
		when: GtRenameActionAnnouncement
		do: [ :ann | 
			(#(#textUpdated #accept) includes: ann eventType)
				ifTrue: [ self addRefactoringPreview ].
			ann eventType = #cancel ifTrue: [ self cancelRefactoring ] ]
		for: self.
	editor
		inUIProcessDo: [ renameAction install.
			self addRefactoringPreview ]
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> locationsForRanges: intervals [
	^ intervals
		collect: [ :each | 
			(editor editor indexForPosition: (each at: 'start')) + 1
				to: (editor editor indexForPosition: (each at: 'end')) ]
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> lspDirectory [
	^ self lspFile lspDirectory
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> lspFile: anObject [
	lspFile := anObject
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> refactoring [
	^ (GtLSPRenameRefactoring on: self lspDirectory)
		lspFile: self lspFile;
		location: position;
		newName: renameAction newName
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> refactoringName [
	^ 'Rename refactoring'
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> restoreText [
	super restoreText.
	lspFile updateServerSource
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> safelyExecute [
	| cursor |
	editor cursors do: [ :each | cursor := each position ].
	cursor
		ifNotNil: [ position := editor editor positionFor: cursor.
			self lspFile
				startRenameAt: position
				do: [ :intervals | self installRenameAction: intervals ] ]
]
