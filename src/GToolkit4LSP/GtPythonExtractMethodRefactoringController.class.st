Class {
	#name : #GtPythonExtractMethodRefactoringController,
	#superclass : #GtLSPRefactoringController,
	#instVars : [
		'interval',
		'lspFile',
		'arguments',
		'functionName',
		'renameAction'
	],
	#category : #'GToolkit4LSP-Refactoring-Python'
}

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> addRefactoringPreview: ref [
	| position |
	self removeRefactoringAttribute.
	position := ref functionLocation + ref functionName size - 1.
	editor editor text
		attribute: (GtRefactoringChangesAttribute new
				refactoring: self refactoring;
				completionAction: [ self cleanUp ];
				cancelAction: [ self cancelRefactoring ];
				showWhenCreated: false)
		from: position
		to: position
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> addRenamerFor: ref [
	self uninstallRenamer.
	renameAction := GtLSPRenameAction
			locations: {ref functionLocation to: ref functionLocation + ref functionName size - 1.
					ref callLocation to: ref callLocation + ref functionName size - 1}
			element: editor.
	renameAction selectAll: true.
	renameAction
		when: GtRenameActionAnnouncement
		do: [ :ann | 
			(#(#textUpdated #accept) includes: ann eventType)
				ifTrue: [ functionName := ann renameAction newName.
					self addRefactoringPreview: ref ].
			ann eventType = #cancel ifTrue: [ self cancelRefactoring ] ].
	renameAction install
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> cleanUp [
	self allowSave.
	self uninstallRenamer.
	super cleanUp
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> interval [
	^ interval
		ifNil: [ | selections |
			selections := editor selection allSelections.
			interval := selections size = 1
					ifTrue: [ selections first interval ifNotNil: [ :i | i first + 1 to: i last ] ]
					ifFalse: [ editor cursors first position + 1 to: editor cursors first position + 1 ] ]
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> lspFile: anObject [
	lspFile := anObject
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> refactoring [
	| ref |
	ref := GtPythonExtractMethodRefactoring
			extract: self interval
			from: self lspFile.
	ref functionName: functionName.
	ref arguments: arguments.
	^ ref
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> refactoringName [
	^ 'Extract function'
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> safelyExecute [
	| ref |
	ref := self refactoring.
	ref primitiveExecute.
	self updateForRefactoring: ref
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> uninstallRenamer [
	renameAction ifNil: [ ^ self ].
	renameAction uninstall.
	renameAction := nil
]

{ #category : #accessing }
GtPythonExtractMethodRefactoringController >> updateForRefactoring: ref [
	functionName := ref functionName.
	arguments := ref arguments.
	self preventSave.
	self setText: ref newSource.
	self addRenamerFor: ref.
	self addRefactoringPreview: ref
]
