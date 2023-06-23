Class {
	#name : #GtLSPDirectoryModel,
	#superclass : #GtLSPModel,
	#instVars : [
		'lspClient',
		'extensions',
		'languageType',
		'fileWatcher',
		'files',
		'styler'
	],
	#category : #'GToolkit4LSP-Model'
}

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
	^ files detect: [ :each | each filename = aFileReference ] ifNone: [  ]
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
	lspClient := aLSPClient
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
