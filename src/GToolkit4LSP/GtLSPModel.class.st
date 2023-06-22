Class {
	#name : #GtLSPModel,
	#superclass : #Object,
	#traits : 'TGtAnnouncer',
	#classTraits : 'TGtAnnouncer classTrait',
	#instVars : [
		'filename',
		'announcer'
	],
	#classVars : [
		'rustAnalyzer'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPModel class >> rustAnalyzer [
	^ rustAnalyzer
]

{ #category : #accessing }
GtLSPModel class >> rustAnalyzer: aString [
	rustAnalyzer := aString
]

{ #category : #'instance creation\t' }
GtLSPModel class >> rustModelOn: aDirectory [
	| client dir semaphore |
	semaphore := Semaphore new.
	dir := aDirectory asFileReference.
	client := GtLanguageServerProtocolStdioClient new
			program: self rustAnalyzer;
			defaultLanguageType: 'rust';
			start;
			yourself.
	client initializeIn: {dir} do: [ semaphore signal ].
	semaphore wait.
	^ GtLSPDirectoryModel new
		filename: dir;
		extensions: '*.rs';
		lspClient: client
]

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
	^ filename
]

{ #category : #accessing }
GtLSPModel >> filename: anObject [
	filename := anObject asFileReference
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

{ #category : #accessing }
GtLSPModel >> lspClient [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtLSPModel >> lspDirectory [
	^ self subclassResponsibility
]
