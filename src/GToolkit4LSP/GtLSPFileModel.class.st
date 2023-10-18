Class {
	#name : #GtLSPFileModel,
	#superclass : #GtLSPModel,
	#instVars : [
		'originalSource',
		'source',
		'isOpen',
		'directory',
		'filename',
		'diagnostics',
		'symbolStream'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #refactoring }
GtLSPFileModel >> applyEdits: aCollection [
	| editedSource |
	editedSource := SmaCCString on: self source.
	aCollection
		do: [ :each | 
			| interval |
			interval := self source gtLSPIntervalForRange: (each at: 'range').
			editedSource
				replaceFrom: interval first
				to: interval last
				with: (each at: 'newText') ].
	self source: editedSource asString.
	self updateServerSource
]

{ #category : #accessing }
GtLSPFileModel >> cancel [
	self isModified ifFalse: [ ^ self ].
	self source: self originalSource.
	self updateServerSource
]

{ #category : #actions }
GtLSPFileModel >> close [
	isOpen ifFalse: [ ^ self ].
	self lspClient didClose: filename.
	isOpen := false
]

{ #category : #accessing }
GtLSPFileModel >> diagnostics [
	^ diagnostics
]

{ #category : #accessing }
GtLSPFileModel >> diagnostics: anObject [
	diagnostics := anObject
			ifNotNil: [ :diags | 
				diags
					collect: [ :each | 
						each isDictionary
							ifTrue: [ GtLSPDiagnosticStructure on: each ]
							ifFalse: [ each ] ] ].
	self announce: (GtLSPFileDiagnostics new lspFile: self)
]

{ #category : #accessing }
GtLSPFileModel >> directory [
	^ directory
]

{ #category : #accessing }
GtLSPFileModel >> directory: lspDirectory [
	directory := lspDirectory
]

{ #category : #accessing }
GtLSPFileModel >> editor [
	| editor aptitude |
	self open.
	editor := GtLSPEditor new.
	aptitude := GtLSPEditorAptitude new.
	aptitude lspFile: self.
	self styler ifNotNil: [ :styler | aptitude styler: styler ].
	editor aptitude: aptitude.
	editor editor text: self source asRopedText.
	^ editor
]

{ #category : #actions }
GtLSPFileModel >> fileUpdated [
	| modified |
	modified := self isModified.
	originalSource := nil.
	modified
		ifFalse: [ self source: self originalSource.
			self isOpen ifTrue: [ self updateServerSource ] ]
]

{ #category : #accessing }
GtLSPFileModel >> filename [
	^ filename
]

{ #category : #accessing }
GtLSPFileModel >> filename: anObject [
	filename := anObject asFileReference
]

{ #category : #accessing }
GtLSPFileModel >> gtDisplayOn: stream [
	stream << filename basename
]

{ #category : #initialization }
GtLSPFileModel >> initialize [
	super initialize.
	isOpen := false
]

{ #category : #testing }
GtLSPFileModel >> isModified [
	^ self originalSource ~= self source
]

{ #category : #testing }
GtLSPFileModel >> isOpen [
	^ isOpen
]

{ #category : #accessing }
GtLSPFileModel >> lspClient [
	^ directory lspClient
]

{ #category : #accessing }
GtLSPFileModel >> lspDirectory [
	^ directory
]

{ #category : #accessing }
GtLSPFileModel >> lspFile [
	^ self
]

{ #category : #accessing }
GtLSPFileModel >> methodSymbols [
	| kind |
	kind := (GtLSPSymbolKindEnum enum: 'Method') value.
	^ self symbolStream select: [ :each | each kind = kind ]
]

{ #category : #actions }
GtLSPFileModel >> open [
	isOpen ifTrue: [ ^ self ].
	self lspClient didOpen: filename withContents: self source.
	isOpen := true
]

{ #category : #accessing }
GtLSPFileModel >> originalSource [
	^ originalSource ifNil: [ originalSource := filename contents ]
]

{ #category : #accessing }
GtLSPFileModel >> originalSource: aString [
	originalSource := aString
]

{ #category : #accessing }
GtLSPFileModel >> referencesAt: aPosition [
	| semaphore references |
	semaphore := Semaphore new.
	self lspClient
		findReferencesIn: self lspFile filename
		at: aPosition
		do: [ :items | 
			references := GtLSPReferenceList new
					references: (((items ifNil: [ #() ])
							collect: [ :each | 
								(self lspDirectory fileForUri: each uri)
									ifNotNil: [ :file | 
										GtLSPFileLocation new
											lspFile: file;
											startPosition: each range start;
											endPosition: each range end ] ]) select: #notNil).
			semaphore signal ].
	^ [ semaphore wait.
	references ] asAsyncFuture
]

{ #category : #actions }
GtLSPFileModel >> saveFile [
	self isModified ifFalse: [ ^ self ].
	self lspClient willSave: self filename.
	filename
		ensureDelete;
		writeStreamDo: [ :stream | stream nextPutAll: source ].
	originalSource := self source.
	self lspClient didSave: self filename.
	self announce: (GtLSPFileSaved new lspFile: self)
]

{ #category : #accessing }
GtLSPFileModel >> source [
	^ source ifNil: [ source := self originalSource ]
]

{ #category : #accessing }
GtLSPFileModel >> source: aString [
	| oldSource |
	source = aString ifTrue: [ ^ self ].
	oldSource := source.
	source := aString.
	symbolStream := nil.
	self
		announce: (GtLSPFileSourceChanged new
				lspFile: self;
				oldSource: oldSource;
				yourself)
]

{ #category : #refactoring }
GtLSPFileModel >> startRenameAt: aPosition do: aBlock [
	self lspClient
		prepareRenameFor: self filename
		at: aPosition
		do: [ :obj | 
			obj
				ifNotNil: [ self lspClient
						linkedEditingRangesFor: self filename
						at: aPosition
						do: [ :ranges | aBlock value: ranges ranges ]
						onError: [ (obj includesKey: 'start') ifTrue: [ aBlock value: {obj} ] ] ] ]
]

{ #category : #accessing }
GtLSPFileModel >> styler [
	^ directory styler
]

{ #category : #accessing }
GtLSPFileModel >> symbolStream [
	symbolStream
		ifNil: [ symbolStream := ((AsyncSequenceStream
					forCollection: [ | semaphore values |
						semaphore := Semaphore new.
						self lspClient
							documentSymbolsIn: self filename
							do: [ :items | 
								values := items.
								semaphore signal ].
						semaphore wait.
						values ] asAsyncFuture)
					collect: [ :each | 
						GtLSPDocumentSymbol new
							lspFile: self;
							symbolInformation: each ]) cached ].
	^ symbolStream asyncSimilarCopy
]

{ #category : #accessing }
GtLSPFileModel >> updateServerSource [
	self lspClient
		didChange: filename
		with: {Dictionary new
					at: 'text' put: source;
					yourself}
]
