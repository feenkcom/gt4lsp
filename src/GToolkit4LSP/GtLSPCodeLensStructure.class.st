Class {
	#name : #GtLSPCodeLensStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeLensStructure >> command [
	"The command this code lens represents."

	^ (data at: 'command' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCommandStructure on: obj ]
]

{ #category : #accessing }
GtLSPCodeLensStructure >> command: anObject [
	data at: 'command' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPCodeLensStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPCodeLensStructure >> data [
	"A data entry field that is preserved on a code lens item between
a {@link CodeLensRequest} and a [CodeLensResolveRequest]
(#CodeLensResolveRequest)"

	^ data at: 'data' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCodeLensStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeLensStructure >> range [
	"The range in which this code lens is valid. Should only span a single line."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure on: obj ]
]

{ #category : #accessing }
GtLSPCodeLensStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]
