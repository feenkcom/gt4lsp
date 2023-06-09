Class {
	#name : #GtLSPDidChangeConfigurationRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDidChangeConfigurationRegistrationOptionsStructure >> section [
	^ data at: 'section'
]

{ #category : #accessing }
GtLSPDidChangeConfigurationRegistrationOptionsStructure >> section: anObject [
	data at: 'section' put:  (self objectFor: anObject)
]
