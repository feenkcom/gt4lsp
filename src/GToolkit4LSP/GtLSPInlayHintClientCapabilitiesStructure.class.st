Class {
	#name : #GtLSPInlayHintClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlayHintClientCapabilitiesStructure >> dynamicRegistration [
	"Whether inlay hints support dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPInlayHintClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintClientCapabilitiesStructure >> resolveSupport [
	"Indicates which properties a client can resolve lazily on an inlay
hint."

	^ data at: 'resolveSupport'
]

{ #category : #accessing }
GtLSPInlayHintClientCapabilitiesStructure >> resolveSupport: anObject [
	data at: 'resolveSupport' put:  (self objectFor: anObject)
]
