Class {
	#name : #GtLSPExecuteCommandOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPExecuteCommandOptionsStructure >> commands [
	"The commands to be executed on the server"

	^ data at: 'commands'
]

{ #category : #accessing }
GtLSPExecuteCommandOptionsStructure >> commands: anObject [
	data at: 'commands' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPExecuteCommandOptionsStructure >> create [
	data at: 'commands' put: #()
]

{ #category : #accessing }
GtLSPExecuteCommandOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPExecuteCommandOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
