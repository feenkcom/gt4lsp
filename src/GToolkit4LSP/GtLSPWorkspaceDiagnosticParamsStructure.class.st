Class {
	#name : #GtLSPWorkspaceDiagnosticParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPWorkspaceDiagnosticParamsStructure >> create [
	data at: 'previousResultIds' put: #()
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticParamsStructure >> identifier [
	"The additional identifier provided during registration."

	^ data at: 'identifier' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticParamsStructure >> identifier: anObject [
	data at: 'identifier' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticParamsStructure >> previousResultIds [
	"The currently known diagnostic reports with their
previous result ids."

	^ data at: 'previousResultIds'
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticParamsStructure >> previousResultIds: anObject [
	data at: 'previousResultIds' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
