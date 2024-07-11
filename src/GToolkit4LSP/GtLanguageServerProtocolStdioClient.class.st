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
		'defaultLanguageType',
		'fileVersions',
		'isInitialized',
		'resultHandlers',
		'methodHandlers',
		'errorHandlers',
		'arguments',
		'initializeResult'
	],
	#category : #'GToolkit4LSP-Client'
}

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> arguments [
	^ arguments ifNil: [ #() ]
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> arguments: anObject [
	arguments := anObject
]

{ #category : #completion }
GtLanguageServerProtocolStdioClient >> completeFile: aFileName at: aPosition do: aBlock onError: errorBlock [
	| params file |
	file := fileVersions
			at: aFileName asFileReference
			ifAbsent: [ ^ aBlock cull: nil ].
	params := GtLSPCompletionParamsStructure create
			position: aPosition;
			context: (GtLSPCompletionContextStructure create
					triggerKind: (GtLSPCompletionTriggerKindEnum enum: 'Invoked') value).
	params textDocument uri: file uri.
	self
		sendMessage: 'textDocument/completion'
		with: params
		do: aBlock
		onError: errorBlock
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
GtLanguageServerProtocolStdioClient >> didChange: aFilename with: changes [
	| params fn file |
	fn := aFilename asFileReference.
	file := fileVersions at: fn ifAbsent: [ ^ self ].
	params := GtLSPDidChangeTextDocumentParamsStructure create.
	params textDocument
		version: file nextVersion;
		uri: file uri.
	params contentChanges: changes.
	self sendNotification: 'textDocument/didChange' with: params
]

{ #category : #'document synchronization' }
GtLanguageServerProtocolStdioClient >> didClose: aFilename [
	| params fn file |
	fn := aFilename asFileReference.
	file := fileVersions at: fn ifAbsent: [ ^ self ].
	fileVersions removeKey: fn.
	params := GtLSPDidCloseTextDocumentParamsStructure create.
	params textDocument uri: file uri.
	self sendNotification: 'textDocument/didClose' with: params
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

{ #category : #'document synchronization' }
GtLanguageServerProtocolStdioClient >> didSave: aFileReference [
	| params file |
	file := fileVersions at: aFileReference asFileReference ifAbsent: [ ^ self ].
	params := GtLSPDidSaveTextDocumentParamsStructure create.
	params textDocument uri: file uri.
	self sendNotification: 'textDocument/didSave' with: params
]

{ #category : #symbols }
GtLanguageServerProtocolStdioClient >> documentSymbolsIn: aFileReference do: aBlock [
	| params |
	(initializeResult isNil
		or: [ initializeResult capabilities documentSymbolProvider isNil ])
		ifTrue: [ ^ aBlock cull: nil ].
	params := GtLSPDocumentSymbolParamsStructure create.
	params textDocument uri: aFileReference asFileReference asUrl printString.
	self
		sendMessage: 'textDocument/documentSymbol'
		with: params
		do: [ :array | 
			aBlock
				value: (array
						ifNotNil: [ array
								collect: [ :each | 
									((each includesKey: 'location')
										ifTrue: [ GtLSPSymbolInformationStructure ]
										ifFalse: [ GtLSPDocumentSymbolStructure ]) on: each ] ]) ]
]

{ #category : #references }
GtLanguageServerProtocolStdioClient >> findReferencesIn: aFilename at: aPosition do: aBlock [
	| params file |
	(initializeResult isNil
		or: [ initializeResult capabilities referencesProvider isNil ])
		ifTrue: [ ^ aBlock cull: nil ].
	file := fileVersions
			at: aFilename asFileReference
			ifAbsent: [ ^ aBlock cull: nil ].
	params := GtLSPReferenceParamsStructure create.
	params textDocument uri: file uri.
	params position: aPosition.
	params context includeDeclaration: false.
	self
		sendMessage: 'textDocument/references'
		with: params
		do: [ :refs | 
			aBlock
				cull: (refs ifNotNil: [ refs collect: [ :each | GtLSPLocationStructure on: each ] ]) ]
		onError: [ :refs | aBlock cull: nil ]
]

{ #category : #folding }
GtLanguageServerProtocolStdioClient >> foldingRangesIn: aFileReference do: aBlock [
	| params file |
	(initializeResult isNil
		or: [ initializeResult capabilities foldingRangeProvider isNil ])
		ifTrue: [ ^ aBlock cull: nil ].
	file := fileVersions
			at: aFileReference asFileReference
			ifAbsent: [ ^ aBlock cull: #() ].
	params := GtLSPFoldingRangeParamsStructure create.
	params textDocument uri: file uri.
	self
		sendMessage: 'textDocument/foldingRange'
		with: params
		do: [ :array | aBlock value: (array collect: [ :each | GtLSPFoldingRangeStructure on: each ]) ]
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> getNextId [
	| id |
	id := nextId.
	nextId := nextId + 1.
	^ id
]

{ #category : #references }
GtLanguageServerProtocolStdioClient >> gotoDeclarationIn: aFilename at: aPosition do: aBlock [
	| params file |
	(initializeResult isNil
		or: [ initializeResult capabilities declarationProvider isNil ])
		ifTrue: [ ^ aBlock cull: nil ].
	file := fileVersions
			at: aFilename asFileReference
			ifAbsent: [ ^ aBlock cull: nil ].
	params := GtLSPDefinitionParamsStructure create.
	params textDocument uri: file uri.
	params position: aPosition.
	self
		sendMessage: 'textDocument/declaration'
		with: params
		do: [ :refs | 
			aBlock
				cull: (refs ifNotNil: [ refs collect: [ :each | GtLSPLocationStructure on: each ] ]) ]
		onError: [ :refs | aBlock cull: nil ]
]

{ #category : #references }
GtLanguageServerProtocolStdioClient >> gotoDefinitionIn: aFilename at: aPosition do: aBlock [
	| params file |
	(initializeResult isNil
		or: [ initializeResult capabilities definitionProvider isNil ])
		ifTrue: [ ^ aBlock cull: nil ].
	file := fileVersions
			at: aFilename asFileReference
			ifAbsent: [ ^ aBlock cull: nil ].
	params := GtLSPDefinitionParamsStructure create.
	params textDocument uri: file uri.
	params position: aPosition.
	self
		sendMessage: 'textDocument/definition'
		with: params
		do: [ :refs | 
			aBlock
				cull: (refs ifNotNil: [ refs collect: [ :each | GtLSPLocationStructure on: each ] ]) ]
		onError: [ :refs | aBlock cull: nil ]
]

{ #category : #references }
GtLanguageServerProtocolStdioClient >> gotoTypeDefinitionIn: aFilename at: aPosition do: aBlock [
	| params file |
	(initializeResult isNil
		or: [ initializeResult capabilities typeDefinitionProvider isNil ])
		ifTrue: [ ^ aBlock cull: nil ].
	file := fileVersions
			at: aFilename asFileReference
			ifAbsent: [ ^ aBlock cull: nil ].
	params := GtLSPDefinitionParamsStructure create.
	params textDocument uri: file uri.
	params position: aPosition.
	self
		sendMessage: 'textDocument/typeDefinition'
		with: params
		do: [ :refs | 
			aBlock
				cull: (refs ifNotNil: [ refs collect: [ :each | GtLSPLocationStructure on: each ] ]) ]
		onError: [ :refs | aBlock cull: nil ]
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> gtErrorsFor: aView [
	<gtView>
	^ aView textEditor
		priority: 3;
		title: 'Errors';
		text: [ self stderr pollString ]
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> gtProcessInvocationFor: aView [
	<gtView>
	^ aView textEditor
		priority: 2;
		title: 'Process invocation';
		text: [ self program , ' ' , (' ' join: (self arguments collect: #printString)) ]
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> gtProcessSummaryFor: aView [
	<gtView>
	^ aView forward
		priority: 1;
		title: 'Process summary';
		object: [ externalProcess ];
		view: #gtSummaryFor:
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> handleUnknownError: aDictionary [ 
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> handleUnknownMethod: aDictionary [ 
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> handleUnknownResult: aDictionary [
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> initialize [
	super initialize.
	mutex := Monitor new.
	nextId := 1.
	resultHandlers := Dictionary new.
	methodHandlers := Dictionary new.
	errorHandlers := Dictionary new.
	defaultLanguageType := ''.
	fileVersions := Dictionary new.
]

{ #category : #lifecycle }
GtLanguageServerProtocolStdioClient >> initializeIn: directories do: aBlock onError: errorBlock [
	| params |
	params := self initializeParameters.
	params processId: nil.
	params
		workspaceFolders: (directories asArray
				collect: [ :each | 
					GtLSPWorkspaceFolderStructure new
						name: each asFileReference basename;
						uri: each asFileReference asUrl printString;
						asDictionary ]).
	self
		sendMessage: 'initialize'
		with: params
		whenResult: GtLSPInitializeResultStructure
		do: [ :each | 
			initializeResult := each.
			self
				sendNotification: 'initialized'
				with: GtLSPInitializedParamsStructure create.
			aBlock value ]
		onError: errorBlock
]

{ #category : #lifecycle }
GtLanguageServerProtocolStdioClient >> initializeParameters [
	^ GtLSPInitializeParamsStructure create
]

{ #category : #refactoring }
GtLanguageServerProtocolStdioClient >> linkedEditingRangesFor: aFileReference at: aPosition do: aBlock onError: errorBlock [
	| params |
	(initializeResult isNil
		or: [ initializeResult capabilities linkedEditingRangeProvider isNil ])
		ifTrue: [ ^ errorBlock cull: nil ].
	params := GtLSPLinkedEditingRangeParamsStructure create.
	params textDocument uri: aFileReference asFileReference asUrl printString.
	params position: aPosition.
	self
		sendMessage: 'textDocument/linkedEditingRange'
		with: params
		whenResult: GtLSPLinkedEditingRangesStructure
		do: aBlock
		onError: errorBlock
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> loadJsonFrom: aStream [
	| jsonObjects headers |
	jsonObjects := OrderedCollection new.
	[ aStream atEnd ]
		whileFalse: [ headers := Dictionary new.
			self receiveHeadersFrom: aStream into: headers.
			aStream atEnd
				ifFalse: [ jsonObjects
						add: (GtJson
								forJsonString: (aStream next: (headers at: 'content-length') asNumber) utf8Decoded)
								jsonObject ] ].
	^ jsonObjects
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

{ #category : #methods }
GtLanguageServerProtocolStdioClient >> on: aString as: aClass do: aBlock [
	self on: aString do: [ :dict | aBlock value: (aClass on: dict) ]
]

{ #category : #methods }
GtLanguageServerProtocolStdioClient >> on: aString as: aClass send: aSelector to: anObject [
	self
		on: aString
		as: aClass
		do: (WeakMessageSend receiver: anObject selector: aSelector)
]

{ #category : #methods }
GtLanguageServerProtocolStdioClient >> on: aString do: aBlock [
	aBlock
		ifNil: [ methodHandlers removeKey: aString ifAbsent: [  ] ]
		ifNotNil: [ methodHandlers at: aString put: aBlock ]
]

{ #category : #refactoring }
GtLanguageServerProtocolStdioClient >> prepareRenameFor: aFileReference at: aPosition do: aBlock [
	| params |
	(initializeResult isNil
		or: [ initializeResult capabilities renameProvider isNil ])
		ifTrue: [ ^ aBlock cull: nil ].
	params := GtLSPPrepareRenameParamsStructure create.
	params textDocument uri: aFileReference asFileReference asUrl printString.
	params position: aPosition.
	self
		sendMessage: 'textDocument/prepareRename'
		with: params
		do: aBlock
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> processMessage: aDictionary [
	| id handler |
	(aDictionary includesKey: 'result')
		ifTrue: [ id := aDictionary at: 'id' ifAbsent: [ 0 ].
			handler := resultHandlers at: id ifAbsent: [  ].
			resultHandlers removeKey: id ifAbsent: [  ].
			errorHandlers removeKey: id ifAbsent: [  ].
			^ handler
				ifNil: [ self handleUnknownResult: aDictionary ]
				ifNotNil: [ [ handler cull: aDictionary ] fork ] ].
	(aDictionary includesKey: 'error')
		ifTrue: [ id := aDictionary at: 'id' ifAbsent: [ 0 ].
			handler := errorHandlers at: id ifAbsent: [  ].
			resultHandlers removeKey: id ifAbsent: [  ].
			errorHandlers removeKey: id ifAbsent: [  ].
			^ handler
				ifNil: [ self handleUnknownError: aDictionary ]
				ifNotNil: [ [ handler cull: aDictionary ] fork ] ].
	(aDictionary includesKey: 'method')
		ifTrue: [ handler := methodHandlers at: (aDictionary at: 'method') ifAbsent: [  ].
			^ handler
				ifNil: [ self handleUnknownMethod: aDictionary ]
				ifNotNil: [ [ handler cull: (aDictionary at: 'params' ifAbsent: [ Dictionary new ]) ] fork ] ]
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
	| bytes length data json |
	length := (headers at: 'content-length' ifAbsent: [ 0 ]) asNumber.
	bytes := aStream next: length.
	bytes size = length ifFalse: [ ^ false ].
	json := bytes utf8Decoded.
	(GtLSPServerOutputSignal new message: json) emit.
	data := (GtJson forJsonString: json) jsonObject.
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

{ #category : #refactoring }
GtLanguageServerProtocolStdioClient >> renameFor: aFileReference at: aPosition to: aString do: aBlock onError: errorBlock [
	| params |
	(initializeResult isNil
		or: [ initializeResult capabilities renameProvider isNil ])
		ifTrue: [ ^ errorBlock
				cull: (Dictionary new
						at: 'error'
							put: (Dictionary new
									at: 'message' put: 'Rename not supported';
									yourself);
						yourself) ].
	params := GtLSPRenameParamsStructure create.
	params textDocument uri: aFileReference asFileReference asUrl printString.
	params position: aPosition.
	params newName: aString.
	self
		sendMessage: 'textDocument/rename'
		with: params
		whenResult: GtLSPWorkspaceEditStructure
		do: aBlock
		onError: errorBlock
]

{ #category : #diagnostics }
GtLanguageServerProtocolStdioClient >> requestDiagnosticsFor: aFileReference do: aBlock onError: errorBlock [
	| params file |
	(initializeResult isNil
		or: [ initializeResult capabilities diagnosticProvider isNil ])
		ifTrue: [ ^ errorBlock cull: nil ].
	file := fileVersions
			at: aFileReference asFileReference
			ifAbsent: [ ^ errorBlock cull: nil ].
	params := GtLSPDocumentDiagnosticParamsStructure create.
	params textDocument uri: file uri.
	self
		sendMessage: 'textDocument/diagnostic'
		with: params
		whenResult: GtLSPRelatedFullDocumentDiagnosticReportStructure
		do: aBlock
		onError: errorBlock
]

{ #category : #messages }
GtLanguageServerProtocolStdioClient >> send: aString with: aStructure id: id [
	| string data jsonData dict |
	(externalProcess isNil or: [ externalProcess isTerminated ])
		ifTrue: [ (errorHandlers at: id ifAbsent: [ [  ] ]) cull: nil.
			self terminate.
			^ self ].
	dict := Dictionary new
			at: 'jsonrpc' put: '2.0';
			at: 'id' put: id;
			at: 'method' put: aString;
			yourself.
	aStructure ifNotNil: [ dict at: 'params' put: aStructure asDictionary ].
	data := GtJson forJsonObject: dict.
	jsonData := data asJsonString.
	(GtLSPServerInputSignal new message: jsonData) emit.
	string := 'Content-Length: ' , jsonData utf8Encoded size printString
			, String crlf , String crlf , jsonData.
	mutex critical: [ stdin nextPutAll: string ]
]

{ #category : #messages }
GtLanguageServerProtocolStdioClient >> sendMessage: aString with: aStructure [
	| id |
	id := self getNextId.
	self
		send: aString
		with: aStructure
		id: id
]

{ #category : #messages }
GtLanguageServerProtocolStdioClient >> sendMessage: aString with: aStructure do: aBlock [
	| id |
	id := self getNextId.
	resultHandlers
		at: id
		put: [ :data | aBlock cull: (data at: 'result' ifAbsent: [ Dictionary new ]) ].
	self
		send: aString
		with: aStructure
		id: id
]

{ #category : #messages }
GtLanguageServerProtocolStdioClient >> sendMessage: aString with: aStructure do: aBlock onError: errorBlock [
	| id |
	id := self getNextId.
	resultHandlers
		at: id
		put: [ :data | aBlock cull: (data at: 'result' ifAbsent: [ Dictionary new ]) ].
	errorHandlers at: id put: errorBlock.
	self
		send: aString
		with: aStructure
		id: id
]

{ #category : #messages }
GtLanguageServerProtocolStdioClient >> sendMessage: aString with: aStructure whenResult: aClass do: aBlock [
	| id |
	id := self getNextId.
	resultHandlers
		at: id
		put: [ :data | aBlock cull: (aClass on: (data at: 'result' ifAbsent: [ Dictionary new ])) ].
	self
		send: aString
		with: aStructure
		id: id
]

{ #category : #messages }
GtLanguageServerProtocolStdioClient >> sendMessage: aString with: aStructure whenResult: aClass do: aBlock onError: errorBlock [
	| id |
	id := self getNextId.
	resultHandlers
		at: id
		put: [ :data | aBlock cull: (aClass on: (data at: 'result' ifAbsent: [ Dictionary new ])) ].
	errorHandlers at: id put: errorBlock.
	self
		send: aString
		with: aStructure
		id: id
]

{ #category : #messages }
GtLanguageServerProtocolStdioClient >> sendNotification: aString with: aStructure [
	| string data jsonData dict |
	(externalProcess isNil or: [ externalProcess isTerminated ])
		ifTrue: [ self terminate.
			^ self ].
	dict := Dictionary new
			at: 'jsonrpc' put: '2.0';
			at: 'method' put: aString;
			yourself.
	aStructure ifNotNil: [ dict at: 'params' put: aStructure asDictionary ].
	data := GtJson forJsonObject: dict.
	jsonData := data asJsonString.
	(GtLSPServerInputSignal new message: jsonData) emit.
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
		do: [ :each | 
			| stderrString stdoutString |
			self sendNotification: 'exit' with: nil.
			stderrString := stderr pollString.
			stdoutString := stdout pollString.
			self terminate.
			stderr := stderrString readStream.
			stdout := stdoutString readStream ]
]

{ #category : #running }
GtLanguageServerProtocolStdioClient >> start [
	| currentOutput previous |
	externalProcess := [ 
		(GtExternalProcessBuilder new: program)
			args: self arguments;
			pipeStdin;
			pipeStdout;
			pipeStderr;
			spawn ] 
				on: GtExternalProcessFailedToStart
				do: [ :exception |
					"We want to be resilient against failures" 
					exception child ].
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
GtLanguageServerProtocolStdioClient >> stderr [
	^ stderr
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> stderr: anObject [
	^ stderr := anObject
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> stdin [
	^ stdin
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> stdin: anObject [
	^ stdin := anObject
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> stdout [
	^ stdout
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> stdout: anObject [
	^ stdout := anObject
]

{ #category : #accessing }
GtLanguageServerProtocolStdioClient >> supportsIncrementalUpdates [
	^ ((initializeResult capabilities ifNotNil: [ :cap | cap textDocumentSync ])
		ifNil: [ 2 ]) = 2
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
			stdin := nil ].
	resultHandlers := Dictionary new
]

{ #category : #'document synchronization' }
GtLanguageServerProtocolStdioClient >> willSave: aFileReference [
	| params file |
	file := fileVersions at: aFileReference asFileReference ifAbsent: [ ^ self ].
	params := GtLSPWillSaveTextDocumentParamsStructure create.
	params textDocument uri: file uri.
	params reason: (GtLSPTextDocumentSaveReasonEnum enum: 'Manual') value.
	self sendNotification: 'textDocument/willSave' with: params
]
