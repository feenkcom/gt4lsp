Class {
	#name : #GtLSPInlineValueContextStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPInlineValueContextStructure >> create [
	data at: 'stoppedLocation' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPInlineValueContextStructure >> frameId [
	"The stack frame (as a DAP Id) where the execution has stopped."

	^ data at: 'frameId'
]

{ #category : #accessing }
GtLSPInlineValueContextStructure >> frameId: anObject [
	data at: 'frameId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineValueContextStructure >> stoppedLocation [
	"The document range where execution has stopped.
Typically the end position of the range denotes the line where the inline values are shown."

	^ (data at: 'stoppedLocation') ifNotNil: [ :obj | GtLSPRangeStructure on: obj ]
]

{ #category : #accessing }
GtLSPInlineValueContextStructure >> stoppedLocation: anObject [
	data at: 'stoppedLocation' put:  (self objectFor: anObject)
]
