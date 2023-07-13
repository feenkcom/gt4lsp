Class {
	#name : #GtLSPCodeActionOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeActionOptionsStructure >> codeActionKinds [
	"CodeActionKinds that this server may return.

The list of kinds may be generic, such as `CodeActionKind.Refactor`, or the server
may list out every specific kind they provide."

	^ data at: 'codeActionKinds' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCodeActionOptionsStructure >> codeActionKinds: anObject [
	data at: 'codeActionKinds' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionOptionsStructure >> resolveProvider [
	"The server provides support to resolve additional
information for a code action.

@since 3.16.0"

	^ data at: 'resolveProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCodeActionOptionsStructure >> resolveProvider: anObject [
	data at: 'resolveProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCodeActionOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
