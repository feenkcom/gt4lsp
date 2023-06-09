Class {
	#name : #GtLSPCodeActionStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeActionStructure >> command [
	"A command this code action executes. If a code action
provides an edit and a command, first the edit is
executed and then the command."

	^ (data at: 'command') ifNotNil: [ :obj | GtLSPCommandStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCodeActionStructure >> command: anObject [
	data at: 'command' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionStructure >> data [
	"A data entry field that is preserved on a code action between
a `textDocument/codeAction` and a `codeAction/resolve` request.

@since 3.16.0"

	^ data at: 'data'
]

{ #category : #accessing }
GtLSPCodeActionStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionStructure >> diagnostics [
	"The diagnostics that this code action resolves."

	^ data at: 'diagnostics'
]

{ #category : #accessing }
GtLSPCodeActionStructure >> diagnostics: anObject [
	data at: 'diagnostics' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionStructure >> disabled [
	"Marks that the code action cannot currently be applied.

Clients should follow the following guidelines regarding disabled code actions:

  - Disabled code actions are not shown in automatic [lightbulbs](https://code.visualstudio.com/docs/editor/editingevolved#_code-action)
    code action menus.

  - Disabled actions are shown as faded out in the code action menu when the user requests a more specific type
    of code action, such as refactorings.

  - If the user has a [keybinding](https://code.visualstudio.com/docs/editor/refactoring#_keybindings-for-code-actions)
    that auto applies a code action and only disabled code actions are returned, the client should show the user an
    error message with `reason` in the editor.

@since 3.16.0"

	^ data at: 'disabled'
]

{ #category : #accessing }
GtLSPCodeActionStructure >> disabled: anObject [
	data at: 'disabled' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionStructure >> edit [
	"The workspace edit this code action performs."

	^ (data at: 'edit') ifNotNil: [ :obj | GtLSPWorkspaceEditStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCodeActionStructure >> edit: anObject [
	data at: 'edit' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionStructure >> isPreferred [
	"Marks this as a preferred action. Preferred actions are used by the `auto fix` command and can be targeted
by keybindings.

A quick fix should be marked preferred if it properly addresses the underlying error.
A refactoring should be marked preferred if it is the most reasonable choice of actions to take.

@since 3.15.0"

	^ data at: 'isPreferred'
]

{ #category : #accessing }
GtLSPCodeActionStructure >> isPreferred: anObject [
	data at: 'isPreferred' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionStructure >> kind [
	"The kind of the code action.

Used to filter code actions."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPCodeActionStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionStructure >> title [
	"A short, human-readable, title for this code action."

	^ data at: 'title'
]

{ #category : #accessing }
GtLSPCodeActionStructure >> title: anObject [
	data at: 'title' put:  (self objectFor: anObject)
]
