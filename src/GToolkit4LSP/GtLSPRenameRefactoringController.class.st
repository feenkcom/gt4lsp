Class {
	#name : #GtLSPRenameRefactoringController,
	#superclass : #GtLSPRefactoringController,
	#instVars : [
		'renameAction',
		'position',
		'lspFile',
		'locations'
	],
	#category : #'GToolkit4LSP-Refactoring'
}

{ #category : #accessing }
GtLSPRenameRefactoringController >> addRefactoringPreview: action [
	| refactoring |
	refactoring := (GtLSPRenameRefactoring on: self lspDirectory)
			lspFile: self lspFile;
			location: position;
			newName: action newName.
	editor editor text
		attribute: (GtRefactoringChangesAttribute new
				refactoring: refactoring;
				completionAction: [ self cleanUp ];
				cancelAction: [ self cancelRefactoring ];
				showWhenCreated: true)
		from: locations first last
		to: locations first last
]

{ #category : #accessing }
GtLSPRenameRefactoringController >> installRenameAction: intervals [
	| action |
	locations := self locationsForRanges: intervals.
	action := GtLSPRenameAction locations: locations element: editor.
	action selectAll: true.
	action
		when: GtRenameActionAnnouncement
		do: [ :ann | 
			ann eventType = #accept ifTrue: [ self addRefactoringPreview: action ].
			ann eventType = #cancel ifTrue: [ self cancelRefactoring ] ].
	editor inUIProcessDo: [ action install ]
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
GtLSPRenameRefactoringController >> safelyExecute [
	| cursor |
	editor cursors do: [ :each | cursor := each position ].
	cursor
		ifNotNil: [ position := editor editor positionFor: cursor.
			self lspFile
				startRenameAt: position
				do: [ :intervals | self installRenameAction: intervals ] ]
]
