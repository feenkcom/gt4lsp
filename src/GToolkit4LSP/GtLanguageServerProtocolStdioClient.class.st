Class {
	#name : #GtLanguageServerProtocolStdioClient,
	#superclass : #Object,
	#instVars : [
		'program',
		'stdout',
		'mutex',
		'stdin',
		'stderr',
		'externalProcess',
		'messageHandler',
		'nextId',
		'handlers',
		'capabilities',
		'defaultLanguageType',
		'fileVersions'
	],
	#category : #'GToolkit4LSP-Client'
}

{ #category : #completion }
GtLanguageServerProtocolStdioClient >> completeFile: aFileName at: anIndex do: aBlock [
	| params file |
	file := fileVersions at: aFileName asFileReference.
	params := GtLSPTextDocumentPositionParamsStructure create.
	params
		textDocument: file uri;
		position: (file endPositionFor: anIndex).
	params data at: 'textDocument'.
	self
		sendMessage: 'textDocument/completion'
		with: params
		do: aBlock
]

{ #category : #completion }
GtLanguageServerProtocolStdioClient >> completionsAt: anIndex do: aBlock [
	
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> defaultLanguageType [
	^ defaultLanguageType
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> defaultLanguageType: anObject [
	defaultLanguageType := anObject
]

{ #category : #'document synchronization' }
GtLanguageServerProtocolStdioClient >> didChange: aFilename from: from to: to with: aString [
	| params fn file changes |
	fn := aFilename asFileReference.
	file := fileVersions at: fn.
	params := GtLSPDidChangeTextDocumentParamsStructure create.
	params textDocument version: file nextVersion.
	params textDocument data at: 'uri' put: file uri.
	changes := {Dictionary new
				at: 'text' put: aString;
				at: 'range'
					put: (GtLSPRangeStructure create
							start: (file startPositionFor: from);
							end: (file endPositionFor: to);
							yourself) asDictionary}.
	params contentChanges: changes.
	self sendNotification: 'textDocument/didChange' with: params
]

{ #category : #'document synchronization' }
GtLanguageServerProtocolStdioClient >> didClose: aFilename [
	| params fn file |
	fn := aFilename asFileReference.
	file := fileVersions at: fn.
	fileVersions removeKey: fn.
	params := GtLSPDidCloseTextDocumentParamsStructure create.
	params textDocument: file uri.
	self sendNotification: 'textDocument/didOpen' with: params
]

{ #category : #'document synchronization' }
GtLanguageServerProtocolStdioClient >> didOpen: aFilename [
	| contents |
	contents := aFilename asFileReference contents.
	self didOpen: aFilename withContents: contents
]

{ #category : #'document synchronization' }
GtLanguageServerProtocolStdioClient >> didOpen: aFilename type: aString withContents: contents [
	| params fn file |
	fn := aFilename asFileReference.
	params := GtLSPDidOpenTextDocumentParamsStructure create.
	file := GtLSPFile new.
	file filename: fn.
	file contents: contents.
	fileVersions at: fn put: file.
	params textDocument
		uri: file uri;
		languageId: aString;
		text: contents;
		version: file version.
	self sendNotification: 'textDocument/didOpen' with: params
]

{ #category : #'document synchronization' }
GtLanguageServerProtocolStdioClient >> didOpen: aFilename withContents: contents [
	self
		didOpen: aFilename
		type: self defaultLanguageType
		withContents: contents
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> getNextId [
	| id |
	id := nextId.
	nextId := nextId + 1.
	^ id
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> initialize [
	super initialize.
	mutex := Monitor new.
	nextId := 1.
	handlers := Dictionary new.
	defaultLanguageType := ''.
	fileVersions := Dictionary new
]

{ #category : #lifecycle }
GtLanguageServerProtocolStdioClient >> initialize: params [
	self
		sendMessage: 'initialize'
		with: params
		whenResult: GtLSPInitializeResultStructure
		do: [ :each | 
			capabilities := each capabilities.
			self
				sendNotification: 'initialized'
				with: GtLSPInitializedParamsStructure create ]
]

{ #category : #lifecycle }
GtLanguageServerProtocolStdioClient >> initializeIn: directories [
	| params |
	params := self initializeParameters.
	params data
		at: 'workspaceFolders'
		put: (directories asArray
				collect: [ :each | 
					GtLSPWorkspaceFolderStructure new
						name: each asFileReference basename;
						uri: each asFileReference asUrl printString;
						asDictionary ]).
	self initialize: params
]

{ #category : #lifecycle }
GtLanguageServerProtocolStdioClient >> initializeParameters [
	^ GtLSP_InitializeParamsStructure create
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> nextLineIn: aStream [
	| outputStream lastWasCr |
	outputStream := WriteStream on: (ByteArray new: 100).
	lastWasCr := false.
	[ aStream atEnd ]
		whileFalse: [ | byte |
			byte := aStream next.
			(lastWasCr and: [ byte = 10 ])
				ifTrue: [ outputStream position: outputStream position - 1.
					^ outputStream contents ].
			outputStream nextPut: byte.
			lastWasCr := 13 = byte ].
	^ nil
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> processMessage: aDictionary [
	| id handler |
	id := aDictionary at: 'id' ifAbsent: [ 0 ].
	handler := handlers at: id ifAbsent: [  ].
	handler ifNotNil: [ [ handler cull: aDictionary ] fork ]
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> processMessagePart: aString [
	| stream headers |
	stream := aString utf8Encoded readStream.
	headers := Dictionary new.
	(self receiveHeadersFrom: stream into: headers) ifFalse: [ ^ aString ].
	(self receiveContentFrom: stream using: headers) ifFalse: [ ^ aString ].
	^ stream upToEnd utf8Decoded
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> program [
	^ program
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> program: aString [
	program := aString
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> receiveContentFrom: aStream using: headers [
	| bytes length data |
	length := (headers at: 'content-length' ifAbsent: [ 0 ]) asNumber.
	bytes := aStream next: length.
	bytes size = length ifFalse: [ ^ false ].
	data := (GtJson forJsonString: bytes utf8Decoded) jsonObject.
	self processMessage: data.
	^ true
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> receiveHeadersFrom: aStream into: aDictionary [
	| line key value index string |
	[ line := self nextLineIn: aStream.
	line ifNil: [ ^ false ].
	line isEmpty ]
		whileFalse: [ string := line utf8Decoded.
			index := string indexOf: $:.
			key := string first: index - 1.
			value := (string allButFirst: index) trim.
			aDictionary at: key asLowercase put: value ].
	^ true
]

{ #category : #completion }
GtLanguageServerProtocolStdioClient >> requestCompleteFile: aFileName at: anIndex do: aBlock [
	| params file |
	file := fileVersions at: aFileName asFileReference.
	params := GtLSPCompletionParamsStructure new
			data: (GtLSPTextDocumentPositionParamsStructure create
					textDocument: file uri;
					position: (file endPositionFor: anIndex)) asDictionary.
	params
		context: (GtLSPCompletionContextStructure create
				triggerKind: (GtLSPCompletionTriggerKindEnum enum: 'Invoked') value).
	self
		sendMessage: 'textDocument/completion'
		with: params
		do: aBlock
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> send: aString with: aStructure id: id [
	| string data jsonData dict |
	dict := Dictionary new
			at: 'jsonrpc' put: '2.0';
			at: 'id' put: id;
			at: 'method' put: aString;
			yourself.
	aStructure ifNotNil: [ dict at: 'params' put: aStructure asDictionary ].
	data := GtJson forJsonObject: dict.
	jsonData := data asJsonString.
	string := 'Content-Length: ' , jsonData utf8Encoded size printString
			, String crlf , String crlf , jsonData.
	mutex critical: [ stdin nextPutAll: string ]
]

{ #category : #lifecycle }
GtLanguageServerProtocolStdioClient >> sendInitialize [
	self initialize: self initializeParameters
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> sendMessage: aString with: aStructure [
	| id |
	id := self getNextId.
	self
		send: aString
		with: aStructure
		id: id
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> sendMessage: aString with: aStructure do: aBlock [
	| id |
	id := self getNextId.
	handlers
		at: id
		put: [ :data | aBlock cull: (data at: 'result' ifAbsent: [ Dictionary new ]) ].
	self
		send: aString
		with: aStructure
		id: id
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> sendMessage: aString with: aStructure whenResult: aClass do: aBlock [
	| id |
	id := self getNextId.
	handlers
		at: id
		put: [ :data | aBlock cull: (aClass new data: (data at: 'result' ifAbsent: [ Dictionary new ])) ].
	self
		send: aString
		with: aStructure
		id: id
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> sendNotification: aString with: aStructure [
	| string data jsonData dict |
	dict := Dictionary new
			at: 'jsonrpc' put: '2.0';
			at: 'method' put: aString;
			yourself.
	aStructure
		ifNotNil: [ dict
				at: 'params' put: aStructure asDictionary ].
	data := GtJson forJsonObject: dict.
	jsonData := data asJsonString.
	string := 'Content-Length: ' , jsonData utf8Encoded size printString
			, String crlf , String crlf , jsonData.
	mutex critical: [ stdin nextPutAll: string ]
]

{ #category : #lifecycle }
GtLanguageServerProtocolStdioClient >> shutdown [
	self
		sendMessage: 'shutdown'
		with: nil
		whenResult: GtLSPStructure
		do: [ :each | self sendNotification: 'exit' with: nil ]
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> start [
	| currentOutput previous |
	externalProcess := (GtExternalProcessBuilder new: program)
			pipeStdin;
			pipeStdout;
			pipeStderr;
			spawn.
	stdout := externalProcess asynchronousStdout.
	stderr := externalProcess asynchronousStderr.
	stdin := externalProcess stdin.
	currentOutput := ''.
	messageHandler := stdout
			pollStringEvery: 20 milliseconds
			do: [ :str | 
				currentOutput := currentOutput , str.
				[ currentOutput := self processMessagePart: currentOutput.
				previous = currentOutput ] whileFalse: [ previous := currentOutput ] ]
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> terminate [
	externalProcess
		ifNotNil: [ externalProcess terminate.
			externalProcess := nil ].
	messageHandler
		ifNotNil: [ (messageHandler isTerminated or: [ messageHandler isTerminating ])
				ifFalse: [ messageHandler terminate ].
			messageHandler := nil ].
	stderr
		ifNotNil: [ stderr release.
			stderr := nil ].
	stdout
		ifNotNil: [ stdout release.
			stdout := nil ].
	stdin
		ifNotNil: [ stdin release.
			stdin := nil ]
]
