Class {
	#name : #GtLSPCodeActionClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> codeActionLiteralSupport [
	"The client support code action literals of type `CodeAction` as a valid
response of the `textDocument/codeAction` request. If the property is not
set the request can only return `Command` literals.

@since 3.8.0"

	^ data at: 'codeActionLiteralSupport'
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> codeActionLiteralSupport: anObject [
	data at: 'codeActionLiteralSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> dataSupport [
	"Whether code action supports the `data` property which is
preserved between a `textDocument/codeAction` and a
`codeAction/resolve` request.

@since 3.16.0"

	^ data at: 'dataSupport'
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> dataSupport: anObject [
	data at: 'dataSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> disabledSupport [
	"Whether code action supports the `disabled` property.

@since 3.16.0"

	^ data at: 'disabledSupport'
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> disabledSupport: anObject [
	data at: 'disabledSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> dynamicRegistration [
	"Whether code action supports dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> honorsChangeAnnotations [
	"Whether the client honors the change annotations in
text edits and resource operations returned via the
`CodeAction#edit` property by for example presenting
the workspace edit in the user interface and asking
for confirmation.

@since 3.16.0"

	^ data at: 'honorsChangeAnnotations'
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> honorsChangeAnnotations: anObject [
	data at: 'honorsChangeAnnotations' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> isPreferredSupport [
	"Whether code action supports the `isPreferred` property.

@since 3.15.0"

	^ data at: 'isPreferredSupport'
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> isPreferredSupport: anObject [
	data at: 'isPreferredSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> resolveSupport [
	"Whether the client supports resolving additional code action
properties via a separate `codeAction/resolve` request.

@since 3.16.0"

	^ data at: 'resolveSupport'
]

{ #category : #accessing }
GtLSPCodeActionClientCapabilitiesStructure >> resolveSupport: anObject [
	data at: 'resolveSupport' put:  (self objectFor: anObject)
]
