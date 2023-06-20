Class {
	#name : #GtLSPTextDocumentContentChange,
	#superclass : #BlEvent,
	#instVars : [
		'events'
	],
	#category : #'GToolkit4LSP-Editor'
}

{ #category : #accessing }
GtLSPTextDocumentContentChange >> events [
	^ events
]

{ #category : #accessing }
GtLSPTextDocumentContentChange >> events: anObject [
	events := anObject
]
