Class {
	#name : #GtLSPFileEventStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFileEventStructure >> type [
	"The change type."

	^ data at: 'type'
]

{ #category : #accessing }
GtLSPFileEventStructure >> type: anObject [
	data at: 'type' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileEventStructure >> uri [
	"The file's uri."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPFileEventStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
