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

{ #category : #actions }
GtLSPModel >> gtLSPCancelAction [
	<gtLSPToolbarAction>
	self lspFile ifNil: [ ^ nil ].
	^ GtLSPCoderAction new
		id: #cancelAction;
		action: [ self lspFile cancel ];
		title: 'Cancel';
		icon: BrGlamorousVectorIcons cancel;
		order: 11
]

{ #category : #actions }
GtLSPModel >> gtLSPSaveAction [
	<gtLSPToolbarAction>
	self lspFile ifNil: [ ^ nil ].
	^ GtLSPCoderAction new
		id: #saveAction;
		action: [ self lspFile saveFile ];
		title: 'Save';
		icon: BrGlamorousVectorIcons accept;
		order: 10
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
