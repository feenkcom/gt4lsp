Class {
	#name : #GtLSPShowMessageRequestClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPShowMessageRequestClientCapabilitiesStructure >> messageActionItem [
	"Capabilities specific to the `MessageActionItem` type."

	^ data at: 'messageActionItem'
]

{ #category : #accessing }
GtLSPShowMessageRequestClientCapabilitiesStructure >> messageActionItem: anObject [
	data at: 'messageActionItem' put:  (self objectFor: anObject)
]
