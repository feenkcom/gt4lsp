Class {
	#name : #GtLSPInsertReplaceEditStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPInsertReplaceEditStructure >> create [
	data at: 'insert' put: GtLSPRangeStructure create  asDictionary.
	data at: 'replace' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPInsertReplaceEditStructure >> insert [
	"The range if the insert is requested"

	^ (data at: 'insert') ifNotNil: [ :obj | GtLSPRangeStructure on: obj ]
]

{ #category : #accessing }
GtLSPInsertReplaceEditStructure >> insert: anObject [
	data at: 'insert' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInsertReplaceEditStructure >> newText [
	"The string to be inserted."

	^ data at: 'newText'
]

{ #category : #accessing }
GtLSPInsertReplaceEditStructure >> newText: anObject [
	data at: 'newText' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInsertReplaceEditStructure >> replace [
	"The range if the replace is requested."

	^ (data at: 'replace') ifNotNil: [ :obj | GtLSPRangeStructure on: obj ]
]

{ #category : #accessing }
GtLSPInsertReplaceEditStructure >> replace: anObject [
	data at: 'replace' put:  (self objectFor: anObject)
]
