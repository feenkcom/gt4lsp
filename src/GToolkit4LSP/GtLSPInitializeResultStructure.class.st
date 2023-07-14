Class {
	#name : #GtLSPInitializeResultStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInitializeResultStructure >> capabilities [
	"The capabilities the language server provides."

	^ (data at: 'capabilities') ifNotNil: [ :obj | GtLSPServerCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPInitializeResultStructure >> capabilities: anObject [
	data at: 'capabilities' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPInitializeResultStructure >> create [
	data at: 'capabilities' put: GtLSPServerCapabilitiesStructure create  asDictionary
]

{ #category : #accessing }
GtLSPInitializeResultStructure >> serverInfo [
	"Information about the server.

@since 3.15.0"

	^ data at: 'serverInfo' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPInitializeResultStructure >> serverInfo: anObject [
	data at: 'serverInfo' put:  (self objectFor: anObject)
]
