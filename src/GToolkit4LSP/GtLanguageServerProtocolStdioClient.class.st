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
		'handlers'
	],
	#category : #'GToolkit4LSP-Client'
}

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
	handlers := Dictionary new
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
