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

	^ data at: 'identifier'
]

{ #category : #accessing }
GtLSPWorkspaceDiagnosticParamsStructure >> identifier: anObject [
	data at: 'identifier' put:  (self objectFor: anObject)
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
