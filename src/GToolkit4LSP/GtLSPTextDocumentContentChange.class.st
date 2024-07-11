Class {
	#name : #GtLSPTextDocumentContentChange,
	#superclass : #BlEvent,
	#instVars : [
		'events',
		'text'
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

{ #category : #accessing }
GtLSPTextDocumentContentChange >> text [
	^ text
]

{ #category : #accessing }
GtLSPTextDocumentContentChange >> text: anObject [
	text := anObject
]
