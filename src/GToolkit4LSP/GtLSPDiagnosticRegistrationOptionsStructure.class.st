Class {
	#name : #GtLSPDiagnosticRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> id [
	"The id used to register the request. The id can be used to deregister
the request again. See also Registration#id."

	^ data at: 'id' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> id: anObject [
	data at: 'id' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> identifier [
	"An optional identifier under which the diagnostics are
managed by the client."

	^ data at: 'identifier' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> identifier: anObject [
	data at: 'identifier' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> interFileDependencies [
	"Whether the language has inter file dependencies meaning that
editing code in one file can result in a different diagnostic
set in another file. Inter file dependencies are common for
most programming languages and typically uncommon for linters."

	^ data at: 'interFileDependencies'
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> interFileDependencies: anObject [
	data at: 'interFileDependencies' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> workspaceDiagnostics [
	"The server provides support for workspace diagnostics as well."

	^ data at: 'workspaceDiagnostics'
]

{ #category : #accessing }
GtLSPDiagnosticRegistrationOptionsStructure >> workspaceDiagnostics: anObject [
	data at: 'workspaceDiagnostics' put:  (self objectFor: anObject)
]
