Class {
	#name : #GtLSPSemanticTokensOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSemanticTokensOptionsStructure >> create [
	data at: 'legend' put: GtLSPSemanticTokensLegendStructure create  asDictionary
]

{ #category : #accessing }
GtLSPSemanticTokensOptionsStructure >> full [
	"Server supports providing semantic tokens for a full document."

	^ data at: 'full' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensOptionsStructure >> full: anObject [
	data at: 'full' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensOptionsStructure >> legend [
	"The legend used by the server"

	^ (data at: 'legend') ifNotNil: [ :obj | GtLSPSemanticTokensLegendStructure on: obj ]
]

{ #category : #accessing }
GtLSPSemanticTokensOptionsStructure >> legend: anObject [
	data at: 'legend' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensOptionsStructure >> range [
	"Server supports providing semantic tokens for a specific range
of a document."

	^ data at: 'range' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensOptionsStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
