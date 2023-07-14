Class {
	#name : #GtLSPWorkspaceEditClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> changeAnnotationSupport [
	"Whether the client in general supports change annotations on text edits,
create file, rename file and delete file changes.

@since 3.16.0"

	^ data at: 'changeAnnotationSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> changeAnnotationSupport: anObject [
	data at: 'changeAnnotationSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> documentChanges [
	"The client supports versioned document changes in `WorkspaceEdit`s"

	^ data at: 'documentChanges' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> documentChanges: anObject [
	data at: 'documentChanges' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> failureHandling [
	"The failure handling strategy of a client if applying the workspace edit
fails.

@since 3.13.0"

	^ data at: 'failureHandling' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> failureHandling: anObject [
	data at: 'failureHandling' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> normalizesLineEndings [
	"Whether the client normalizes line endings to the client specific
setting.
If set to `true` the client will normalize line ending characters
in a workspace edit to the client-specified new line
character.

@since 3.16.0"

	^ data at: 'normalizesLineEndings' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> normalizesLineEndings: anObject [
	data at: 'normalizesLineEndings' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> resourceOperations [
	"The resource operations the client supports. Clients should at least
support 'create', 'rename' and 'delete' files and folders.

@since 3.13.0"

	^ data at: 'resourceOperations' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceEditClientCapabilitiesStructure >> resourceOperations: anObject [
	data at: 'resourceOperations' put:  (self objectFor: anObject)
]
