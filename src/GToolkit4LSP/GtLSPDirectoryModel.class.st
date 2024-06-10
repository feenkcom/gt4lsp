Class {
	#name : #GtLSPDirectoryModel,
	#superclass : #GtLSPModel,
	#instVars : [
		'lspClient',
		'extensions',
		'languageType',
		'fileWatcher',
		'files',
		'styler',
		'filename',
		'fileMappings'
	],
	#classVars : [
		'Registry'
	],
	#classInstVars : [
		'executable',
		'arguments'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPDirectoryModel class >> arguments [
	^ arguments
		ifNil: [ self ~~ GtLSPDirectoryModel ifTrue: [ superclass arguments ] ifFalse: [ #() ] ]
]

{ #category : #'instance creation' }
GtLSPDirectoryModel class >> arguments: aCollection [
	arguments := aCollection
]

{ #category : #accessing }
GtLSPDirectoryModel class >> executable [
	^ executable
		ifNil: [ self ~~ GtLSPDirectoryModel ifTrue: [ superclass executable ] ]
]

{ #category : #accessing }
GtLSPDirectoryModel class >> executable: anObject [
	executable := anObject
]

{ #category : #accessing }
GtLSPDirectoryModel class >> extensions [
	^ '*'
]

{ #category : #accessing }
GtLSPDirectoryModel class >> languageType [
	^ ''
]

{ #category : #'instance creation' }
GtLSPDirectoryModel class >> local [
	| client dir semaphore model |
	semaphore := Semaphore new.
	dir := FileSystem memory / self name.
	dir ensureCreateDirectory.
	client := GtLanguageServerProtocolStdioClient new
			program: self executable;
			arguments: self arguments;
			defaultLanguageType: self languageType;
			start;
			yourself.
	model := self new
			filename: dir;
			extensions: self extensions;
			lspClient: client;
			styler: self styler.
	client
		initializeIn: #()
		do: [ semaphore signal ]
		onError: [ semaphore signal ].
	semaphore wait.
	self registry
		add: model
		finalizer: (ObjectFinalizer receiver: client selector: #terminate).
	^ model
]

{ #category : #'instance creation' }
GtLSPDirectoryModel class >> onDirectory: aDirectory [
	| client dir semaphore model |
	semaphore := Semaphore new.
	dir := aDirectory asFileReference.
	client := GtLanguageServerProtocolStdioClient new
			program: self executable;
			arguments: self arguments;
			defaultLanguageType: self languageType;
			start;
			yourself.
	model := self new
			filename: dir;
			extensions: self extensions;
			lspClient: client;
			styler: self styler.
	client
		initializeIn: {dir}
		do: [ semaphore signal ]
		onError: [ semaphore signal ].
	semaphore wait.
	self registry
		add: model
		finalizer: (ObjectFinalizer receiver: client selector: #terminate).
	^ model
]

{ #category : #accessing }
GtLSPDirectoryModel class >> registry [
	^ Registry ifNil: [ Registry := WeakRegistry new ]
]

{ #category : #accessing }
GtLSPDirectoryModel class >> styler [
	^ nil
]

{ #category : #accessing }
GtLSPDirectoryModel >> addShortcutsTo: aTextEditor from: anLSPModel inCoder: aLSPCoder [
]

{ #category : #accessing }
GtLSPDirectoryModel >> allSymbolsStream [
	^ self files asAsyncStream flatCollect: [ :each | each symbolStream ]
]

{ #category : #accessing }
GtLSPDirectoryModel >> createFile: aString [
	| file fileRef allFiles |
	allFiles := self files.
	fileRef := filename / aString.
	fileRef writeStreamDo: [ :stream |  ].
	file := GtLSPFileModel new
			filename: fileRef;
			directory: self;
			yourself.
	allFiles add: file.
	fileMappings
		ifNotNil: [ fileMappings
				at: (self fileSystemIsCaseSensitive
						ifTrue: [ file filename uri ]
						ifFalse: [ file filename uri asLowercase ])
				put: file ].
	^ file
]

{ #category : #accessing }
GtLSPDirectoryModel >> diffSplitter [
	^ GtLineDiffSplitter new
]

{ #category : #accessing }
GtLSPDirectoryModel >> diffStyler [
	^ self styler ifNil: [ BlTextNullStyler new ]
]

{ #category : #accessing }
GtLSPDirectoryModel >> extensions [
	^ extensions
]

{ #category : #accessing }
GtLSPDirectoryModel >> extensions: aString [
	extensions := aString
]

{ #category : #'file watcher' }
GtLSPDirectoryModel >> fileDeleted: aFileReference [
	files
		ifNotNil: [ files
				detect: [ :each | each filename = aFileReference ]
				ifFound: [ :file | 
					files remove: file.
					^ self announce: (GtLSPFileDeleted new lspFile: file) ] ]
]

{ #category : #accessing }
GtLSPDirectoryModel >> fileFor: aFileReference [
	^ self files
		detect: [ :each | 
			each filename fileSystem isCaseSensitive
				ifTrue: [ each filename = aFileReference ]
				ifFalse: [ each filename absolutePath pathString
						sameAs: aFileReference absolutePath pathString ] ]
		ifNone: [  ]
]

{ #category : #accessing }
GtLSPDirectoryModel >> fileForUri: aString [
	| uri |
	uri := aString urlDecoded.
	self fileSystemIsCaseSensitive ifFalse: [ uri := uri asLowercase ].
	^ self fileMappings at: uri ifAbsent: [  ]
]

{ #category : #accessing }
GtLSPDirectoryModel >> fileMappings [
	^ fileMappings
		ifNil: [ | uriBlock |
			uriBlock := self fileSystemIsCaseSensitive
					ifTrue: [ [ :each | each ] ]
					ifFalse: [ [ :each | each asLowercase ] ].
			fileMappings := Dictionary new.
			self files
				do: [ :each | fileMappings at: (uriBlock value: each filename uri printString) put: each ].
			fileMappings ]
]

{ #category : #testing }
GtLSPDirectoryModel >> fileSystemIsCaseSensitive [
	^ self filename fileSystem isCaseSensitive
]

{ #category : #'file watcher' }
GtLSPDirectoryModel >> fileUpdated: aFileReference [
	files
		ifNotNil: [ files
				detect: [ :each | each filename = aFileReference ]
				ifFound: [ :file | file fileUpdated ]
				ifNone: [ | file |
					files
						add: (file := GtLSPFileModel new
									directory: self;
									filename: aFileReference;
									yourself).
					self announce: (GtLSPFileAdded new lspFile: file) ] ]
]

{ #category : #accessing }
GtLSPDirectoryModel >> filename [
	^ filename
]

{ #category : #accessing }
GtLSPDirectoryModel >> filename: anObject [
	filename := anObject asFileReference
]

{ #category : #accessing }
GtLSPDirectoryModel >> files [
	^ files
		ifNil: [ files := (filename allDirectories
					flatCollect: [ :dir | 
						(dir filesMatching: self extensions)
							collect: [ :each | 
								GtLSPFileModel new
									filename: each;
									directory: self ] ]) asOrderedCollection
					sort: [ :a :b | a filename pathString < b filename pathString ] ]
]

{ #category : #finalization }
GtLSPDirectoryModel >> finalize [
	self lspClient ifNotNil: [ :client | client terminate ].
	super finalize
]

{ #category : #searching }
GtLSPDirectoryModel >> gtFileSearch: aSearch [
	<gtSearch>
	^ aSearch list
		priority: 10;
		title: 'Files';
		items: [ self files ];
		itemName: [ :item | item filename basename ];
		filterBySubstring
]

{ #category : #private }
GtLSPDirectoryModel >> installMessageHandlers [
]

{ #category : #testing }
GtLSPDirectoryModel >> isLSPDirectory [
	^ true
]

{ #category : #accessing }
GtLSPDirectoryModel >> languageType [
	^ languageType
]

{ #category : #accessing }
GtLSPDirectoryModel >> languageType: aString [
	languageType := aString
]

{ #category : #accessing }
GtLSPDirectoryModel >> lspClient [
	^ lspClient
]

{ #category : #accessing }
GtLSPDirectoryModel >> lspClient: aLSPClient [
	lspClient := aLSPClient.
	self installMessageHandlers
]

{ #category : #accessing }
GtLSPDirectoryModel >> lspDirectory [
	^ self
]

{ #category : #accessing }
GtLSPDirectoryModel >> shutdown [
	self lspClient ifNotNil: [ :client | client shutdown ]
]

{ #category : #'file watcher' }
GtLSPDirectoryModel >> startFileWatcher [
	self stopFileWatcher.
	fileWatcher := GtFileWatcherEventLoop new.
	fileWatcher watch: filename.
	fileWatcher onEvent: [ :anEvent | self updateFileEvent: anEvent ].
	fileWatcher startLoop
]

{ #category : #'file watcher' }
GtLSPDirectoryModel >> stopFileWatcher [
	fileWatcher ifNotNil: [ fileWatcher stopLoop ].
	fileWatcher := nil
]

{ #category : #accessing }
GtLSPDirectoryModel >> styler [
	^ styler
]

{ #category : #accessing }
GtLSPDirectoryModel >> styler: anObject [
	styler := anObject
]

{ #category : #'file watcher' }
GtLSPDirectoryModel >> updateFileEvent: anEvent [
	anEvent paths
		do: [ :each | 
			| ref |
			ref := each asFileReference.
			(ref gtMatches: self extensions)
				ifTrue: [ ref exists
						ifTrue: [ ref isFile ifTrue: [ self fileUpdated: ref ] ]
						ifFalse: [ self fileDeleted: ref ] ] ]
]
