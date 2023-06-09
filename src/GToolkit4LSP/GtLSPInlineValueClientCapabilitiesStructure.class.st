Class {
	#name : #GtLSPInlineValueClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlineValueClientCapabilitiesStructure >> dynamicRegistration [
	"Whether implementation supports dynamic registration for inline value providers."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPInlineValueClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
