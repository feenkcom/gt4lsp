Class {
	#name : #GtLSPExecuteCommandRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPExecuteCommandRegistrationOptionsStructure >> commands [
	"The commands to be executed on the server"

	^ data at: 'commands'
]

{ #category : #accessing }
GtLSPExecuteCommandRegistrationOptionsStructure >> commands: anObject [
	data at: 'commands' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPExecuteCommandRegistrationOptionsStructure >> create [
	data at: 'commands' put: #()
]

{ #category : #accessing }
GtLSPExecuteCommandRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPExecuteCommandRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
