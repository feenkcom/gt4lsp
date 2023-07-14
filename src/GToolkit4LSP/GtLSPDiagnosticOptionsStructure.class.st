Class {
	#name : #GtLSPDiagnosticOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDiagnosticOptionsStructure >> identifier [
	"An optional identifier under which the diagnostics are
managed by the client."

	^ data at: 'identifier' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticOptionsStructure >> identifier: anObject [
	data at: 'identifier' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticOptionsStructure >> interFileDependencies [
	"Whether the language has inter file dependencies meaning that
editing code in one file can result in a different diagnostic
set in another file. Inter file dependencies are common for
most programming languages and typically uncommon for linters."

	^ data at: 'interFileDependencies'
]

{ #category : #accessing }
GtLSPDiagnosticOptionsStructure >> interFileDependencies: anObject [
	data at: 'interFileDependencies' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticOptionsStructure >> workspaceDiagnostics [
	"The server provides support for workspace diagnostics as well."

	^ data at: 'workspaceDiagnostics'
]

{ #category : #accessing }
GtLSPDiagnosticOptionsStructure >> workspaceDiagnostics: anObject [
	data at: 'workspaceDiagnostics' put:  (self objectFor: anObject)
]
