Class {
	#name : #GtLSPDidChangeConfigurationClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDidChangeConfigurationClientCapabilitiesStructure >> dynamicRegistration [
	"Did change configuration notification supports dynamic registration."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDidChangeConfigurationClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]
