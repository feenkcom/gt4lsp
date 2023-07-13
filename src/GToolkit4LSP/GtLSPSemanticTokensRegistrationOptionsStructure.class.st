Class {
	#name : #GtLSPSemanticTokensRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPSemanticTokensRegistrationOptionsStructure >> create [
	data at: 'legend' put: GtLSPSemanticTokensLegendStructure create asDictionary
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> full [
	"Server supports providing semantic tokens for a full document."

	^ data at: 'full' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> full: anObject [
	data at: 'full' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> id [
	"The id used to register the request. The id can be used to deregister
the request again. See also Registration#id."

	^ data at: 'id' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> id: anObject [
	data at: 'id' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> legend [
	"The legend used by the server"

	^ (data at: 'legend') ifNotNil: [ :obj | GtLSPSemanticTokensLegendStructure new data: obj ]
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> legend: anObject [
	data at: 'legend' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> range [
	"Server supports providing semantic tokens for a specific range
of a document."

	^ data at: 'range' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSemanticTokensRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
