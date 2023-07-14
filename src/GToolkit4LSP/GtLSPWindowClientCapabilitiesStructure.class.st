Class {
	#name : #GtLSPWindowClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWindowClientCapabilitiesStructure >> showDocument [
	"Capabilities specific to the showDocument request.

@since 3.16.0"

	^ (data at: 'showDocument' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPShowDocumentClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWindowClientCapabilitiesStructure >> showDocument: anObject [
	data at: 'showDocument' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWindowClientCapabilitiesStructure >> showMessage [
	"Capabilities specific to the showMessage request.

@since 3.16.0"

	^ (data at: 'showMessage' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPShowMessageRequestClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSPWindowClientCapabilitiesStructure >> showMessage: anObject [
	data at: 'showMessage' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWindowClientCapabilitiesStructure >> workDoneProgress [
	"It indicates whether the client supports server initiated
progress using the `window/workDoneProgress/create` request.

The capability also controls Whether client supports handling
of progress notifications. If set servers are allowed to report a
`workDoneProgress` property in the request specific server
capabilities.

@since 3.15.0"

	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWindowClientCapabilitiesStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
