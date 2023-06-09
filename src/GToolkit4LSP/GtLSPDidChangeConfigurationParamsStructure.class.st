Class {
	#name : #GtLSPDidChangeConfigurationParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDidChangeConfigurationParamsStructure >> settings [
	"The actual changed settings"

	^ data at: 'settings'
]

{ #category : #accessing }
GtLSPDidChangeConfigurationParamsStructure >> settings: anObject [
	data at: 'settings' put:  (self objectFor: anObject)
]
