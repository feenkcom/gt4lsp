Class {
	#name : #GtLSPWorkspaceEditStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceEditStructure >> changeAnnotations [
	"A map of change annotations that can be referenced in `AnnotatedTextEdit`s or create, rename and
delete file / folder operations.

Whether clients honor this property depends on the client capability `workspace.changeAnnotationSupport`.

@since 3.16.0"

	^ data at: 'changeAnnotations'
]

{ #category : #accessing }
GtLSPWorkspaceEditStructure >> changeAnnotations: anObject [
	data at: 'changeAnnotations' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceEditStructure >> changes [
	"Holds changes to existing resources."

	^ data at: 'changes'
]

{ #category : #accessing }
GtLSPWorkspaceEditStructure >> changes: anObject [
	data at: 'changes' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceEditStructure >> documentChanges [
	"Depending on the client capability `workspace.workspaceEdit.resourceOperations` document changes
are either an array of `TextDocumentEdit`s to express changes to n different text documents
where each text document edit addresses a specific version of a text document. Or it can contain
above `TextDocumentEdit`s mixed with create, rename and delete file / folder operations.

Whether a client supports versioned document edits is expressed via
`workspace.workspaceEdit.documentChanges` client capability.

If a client neither supports `documentChanges` nor `workspace.workspaceEdit.resourceOperations` then
only plain `TextEdit`s using the `changes` property are supported."

	^ data at: 'documentChanges'
]

{ #category : #accessing }
GtLSPWorkspaceEditStructure >> documentChanges: anObject [
	data at: 'documentChanges' put:  (self objectFor: anObject)
]
