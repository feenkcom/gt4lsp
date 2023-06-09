Class {
	#name : #GtLSPFileOperationFilterStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPFileOperationFilterStructure >> create [
	data at: 'pattern' put: GtLSPFileOperationPatternStructure create  asDictionary
]

{ #category : #accessing }
GtLSPFileOperationFilterStructure >> pattern [
	"The actual file operation pattern."

	^ (data at: 'pattern') ifNotNil: [ :obj | GtLSPFileOperationPatternStructure new data: obj ]
]

{ #category : #accessing }
GtLSPFileOperationFilterStructure >> pattern: anObject [
	data at: 'pattern' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationFilterStructure >> scheme [
	"A Uri scheme like `file` or `untitled`."

	^ data at: 'scheme'
]

{ #category : #accessing }
GtLSPFileOperationFilterStructure >> scheme: anObject [
	data at: 'scheme' put:  (self objectFor: anObject)
]
