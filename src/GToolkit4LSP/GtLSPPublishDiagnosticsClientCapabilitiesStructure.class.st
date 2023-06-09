Class {
	#name : #GtLSPPublishDiagnosticsClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> codeDescriptionSupport [
	"Client supports a codeDescription property

@since 3.16.0"

	^ data at: 'codeDescriptionSupport'
]

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> codeDescriptionSupport: anObject [
	data at: 'codeDescriptionSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> dataSupport [
	"Whether code action supports the `data` property which is
preserved between a `textDocument/publishDiagnostics` and
`textDocument/codeAction` request.

@since 3.16.0"

	^ data at: 'dataSupport'
]

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> dataSupport: anObject [
	data at: 'dataSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> relatedInformation [
	"Whether the clients accepts diagnostics with related information."

	^ data at: 'relatedInformation'
]

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> relatedInformation: anObject [
	data at: 'relatedInformation' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> tagSupport [
	"Client supports the tag property to provide meta data about a diagnostic.
Clients supporting tags have to handle unknown tags gracefully.

@since 3.15.0"

	^ data at: 'tagSupport'
]

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> tagSupport: anObject [
	data at: 'tagSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> versionSupport [
	"Whether the client interprets the version property of the
`textDocument/publishDiagnostics` notification's parameter.

@since 3.15.0"

	^ data at: 'versionSupport'
]

{ #category : #accessing }
GtLSPPublishDiagnosticsClientCapabilitiesStructure >> versionSupport: anObject [
	data at: 'versionSupport' put:  (self objectFor: anObject)
]
