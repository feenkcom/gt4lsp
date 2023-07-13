Class {
	#name : #GtLSPExecuteCommandParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPExecuteCommandParamsStructure >> arguments [
	"Arguments that the command should be invoked with."

	^ data at: 'arguments' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPExecuteCommandParamsStructure >> arguments: anObject [
	data at: 'arguments' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPExecuteCommandParamsStructure >> command [
	"The identifier of the actual command handler."

	^ data at: 'command'
]

{ #category : #accessing }
GtLSPExecuteCommandParamsStructure >> command: anObject [
	data at: 'command' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPExecuteCommandParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPExecuteCommandParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
