Class {
	#name : #GtLSPDefinitionClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDefinitionClientCapabilitiesStructure >> dynamicRegistration [
	"Whether definition supports dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPDefinitionClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDefinitionClientCapabilitiesStructure >> linkSupport [
	"The client supports additional metadata in the form of definition links.

@since 3.14.0"

	^ data at: 'linkSupport'
]

{ #category : #accessing }
GtLSPDefinitionClientCapabilitiesStructure >> linkSupport: anObject [
	data at: 'linkSupport' put:  (self objectFor: anObject)
]
