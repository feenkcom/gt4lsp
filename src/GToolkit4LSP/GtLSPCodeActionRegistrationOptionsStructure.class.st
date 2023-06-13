Class {
	#name : #GtLSPCodeActionRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeActionRegistrationOptionsStructure >> codeActionKinds [
	"CodeActionKinds that this server may return.

The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
may list out every specific kind they provide."

	^ data at: 'codeActionKinds'
]

{ #category : #accessing }
GtLSPCodeActionRegistrationOptionsStructure >> codeActionKinds: anObject [
	data at: 'codeActionKinds' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPCodeActionRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionRegistrationOptionsStructure >> resolveProvider [
	"The server provides support to resolve additional
information for a code action.

@since 3.16.0"

	^ data at: 'resolveProvider'
]

{ #category : #accessing }
GtLSPCodeActionRegistrationOptionsStructure >> resolveProvider: anObject [
	data at: 'resolveProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPCodeActionRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
