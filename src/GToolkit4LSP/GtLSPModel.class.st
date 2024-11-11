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

{ #category : #accessing }
GtLSPModel >> addShortcutsTo: aTextEditor inCoder: aLSPCoder [
	self lspDirectory
		addShortcutsTo: aTextEditor
		from: self
		inCoder: aLSPCoder
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
	^ GtPhlowCompositeTool new
		addTool: (GtPhlowExplicitTool new
				name: self gtDisplayString;
				stencil: [ GtLSPCoder new object: self ]);
		addTool: super gtDefaultInspectorTool
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

{ #category : #accessing }
GtLSPModel >> gtLiveFor: aView [
	<gtView>
	^ aView explicit 
		title: 'Live';
		priority: 1;
		stencil: [ GtLSPCoder new object: self ]
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
