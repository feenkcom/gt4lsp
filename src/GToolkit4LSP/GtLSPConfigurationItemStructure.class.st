Class {
	#name : #GtLSPConfigurationItemStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPConfigurationItemStructure >> scopeUri [
	"The scope to get the configuration section for."

	^ data at: 'scopeUri' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPConfigurationItemStructure >> scopeUri: anObject [
	data at: 'scopeUri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPConfigurationItemStructure >> section [
	"The configuration section asked for."

	^ data at: 'section' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPConfigurationItemStructure >> section: anObject [
	data at: 'section' put:  (self objectFor: anObject)
]
