Class {
	#name : #GtLSPHoverClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPHoverClientCapabilitiesStructure >> contentFormat [
	"Client supports the following content formats for the content
property. The order describes the preferred format of the client."

	^ data at: 'contentFormat' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPHoverClientCapabilitiesStructure >> contentFormat: anObject [
	data at: 'contentFormat' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPHoverClientCapabilitiesStructure >> dynamicRegistration [
	"Whether hover supports dynamic registration."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPHoverClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
