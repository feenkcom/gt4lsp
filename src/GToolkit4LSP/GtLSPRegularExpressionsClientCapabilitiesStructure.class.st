Class {
	#name : #GtLSPRegularExpressionsClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRegularExpressionsClientCapabilitiesStructure >> engine [
	"The engine's name."

	^ data at: 'engine'
]

{ #category : #accessing }
GtLSPRegularExpressionsClientCapabilitiesStructure >> engine: anObject [
	data at: 'engine' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRegularExpressionsClientCapabilitiesStructure >> version [
	"The engine's version."

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPRegularExpressionsClientCapabilitiesStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
