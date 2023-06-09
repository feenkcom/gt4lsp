Class {
	#name : #GtLSPRenameClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRenameClientCapabilitiesStructure >> dynamicRegistration [
	"Whether rename supports dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPRenameClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameClientCapabilitiesStructure >> honorsChangeAnnotations [
	"Whether the client honors the change annotations in
text edits and resource operations returned via the
rename request's workspace edit by for example presenting
the workspace edit in the user interface and asking
for confirmation.

@since 3.16.0"

	^ data at: 'honorsChangeAnnotations'
]

{ #category : #accessing }
GtLSPRenameClientCapabilitiesStructure >> honorsChangeAnnotations: anObject [
	data at: 'honorsChangeAnnotations' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameClientCapabilitiesStructure >> prepareSupport [
	"Client supports testing for validity of rename operations
before execution.

@since 3.12.0"

	^ data at: 'prepareSupport'
]

{ #category : #accessing }
GtLSPRenameClientCapabilitiesStructure >> prepareSupport: anObject [
	data at: 'prepareSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameClientCapabilitiesStructure >> prepareSupportDefaultBehavior [
	"Client supports the default behavior result.

The value indicates the default behavior used by the
client.

@since 3.16.0"

	^ data at: 'prepareSupportDefaultBehavior'
]

{ #category : #accessing }
GtLSPRenameClientCapabilitiesStructure >> prepareSupportDefaultBehavior: anObject [
	data at: 'prepareSupportDefaultBehavior' put:  (self objectFor: anObject)
]
