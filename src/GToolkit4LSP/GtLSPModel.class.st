Class {
	#name : #GtLSPModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'announcer'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #comparing }
GtLSPModel >> = anObject [
	^ self == anObject
		or: [ self class = anObject class and: [ self filename = anObject filename ] ]
]

{ #category : #announcer }
GtLSPModel >> announcer [
	^ announcer ifNil: [ announcer := Announcer new ]
]

{ #category : #accessing }
GtLSPModel >> filename [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtLSPModel >> gtDefaultInspectorTool [
	^ GtPhlowValuableTool new
		name: self gtDisplayString;
		valuable: [ GtLSPCoder new object: self ]
]

{ #category : #comparing }
GtLSPModel >> hash [
	^ self class hash bitXor: self filename hash
]

{ #category : #testing }
GtLSPModel >> isLSPDirectory [
	^ false
]

{ #category : #testing }
GtLSPModel >> isLSPReference [
	^ false
]

{ #category : #accessing }
GtLSPModel >> lspClient [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtLSPModel >> lspDirectory [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtLSPModel >> lspFile [
	^ nil
]
