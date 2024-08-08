Class {
	#name : #GtLSPCoder,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'sidebarElement',
		'contentElement',
		'modified',
		'lspObject',
		'preventUpdates'
	],
	#category : #'GToolkit4LSP-View'
}

{ #category : #private }
GtLSPCoder >> actionsFor: aLSPObject [
	| pragmas |
	pragmas := Pragma
			allNamed: #gtLSPToolbarAction
			from: aLSPObject class
			to: GtLSPModel.
	^ (pragmas collect: [ :each | aLSPObject perform: each method selector ])
		reject: #isNil
]

{ #category : #accessing }
GtLSPCoder >> allowSave [
	preventUpdates := false.
	contentElement
		inUIProcessDo: [ contentElement
				childNamed: #saveAction
				ifFound: [ :elmt | elmt enabled: self lspFile isModified ] ]
]

{ #category : #updating }
GtLSPCoder >> buildDirectoryToolbarFor: aLSPObject [
	^ self buildToolbarFor: aLSPObject lspDirectory
]

{ #category : #sidebar }
GtLSPCoder >> buildSidebarFor: obj [
	^ BrTabGroup new
		aptitude: BrGlamorousTabGroupAptitude;
		padding: (BlInsets all: 5);
		addTab: (BrTab new
				aptitude: BrGlamorousTabAptitude new;
				label: 'Files';
				stencil: [ self createFilesTreeFor: obj ]);
		actionbarStencil: [ BrToolbar new
				aptitude: BrGlamorousToolbarAptitude new;
				addItem: (self searchButtonFor: obj);
				yourself ]
]

{ #category : #updating }
GtLSPCoder >> buildToolbarFor: aLSPObject [
	| toolbar actions |
	actions := (self actionsFor: aLSPObject)
			asSortedCollection: [ :a :b | a order < b order ].
	toolbar := BrToolbar new
			aptitude: (BrGlamorousToolbarAptitude new spacing: 5);
			fitContent;
			margin: (BlInsets bottom: 5).
	actions do: [ :each | each buildToolbarElementIn: toolbar ].
	^ toolbar
]

{ #category : #sidebar }
GtLSPCoder >> createFilesTreeFor: obj [
	| tree |
	tree := BrSimpleTree new
			matchParent;
			rowStencil: BrGlamorousSimpleTreeSelectableRowElementStencilBuilder new;
			nodeStencil: [ BrHorizontalPane new
					hMatchParent;
					vFitContent;
					addChild: (BrLabel new
								aptitude: BrGlamorousLabelAptitude;
								fitContent;
								yourself)
						as: #label;
					addChild: (BrButton new
								background: self theme status changesBackgroundColor;
								size: 8 @ 8;
								geometry: BlEllipseGeometry new;
								margin: (BlInsets
										top: 6
										bottom: 0
										left: 2
										right: 2);
								visibility: BlVisibility gone;
								yourself)
						as: #button ];
			nodeDataBinder: [ :element :each | 
				element userData at: #lspFile put: each last.
				self updateModifiedIn: element.
				(element childNamed: #label) text: each first basename ];
			when: BlElementAddedToSceneGraphEvent do: [ :event | self updateTrees ];
			yourself.
	self updateFileTreeItems: tree.
	obj isLSPDirectory
		ifFalse: [ tree expandSuchThat: [ :each | obj filename isContainedBy: each value first ].
			tree
				selectAndScrollTo: {obj filename.
						obj}.
			self updateContentsTo: obj ].
	tree
		when: BrSelectionChanged
		do: [ :event | 
			tree
				selectedNodeDo: [ :aNode | aNode value last ifNotNil: [ :file | self updateContentsTo: file ] ] ].
	tree id: #files.
	^ tree
]

{ #category : #updating }
GtLSPCoder >> editorChangedTo: aString [
	preventUpdates ifTrue: [ ^ self ].
	contentElement
		childNamed: #editor
		ifFound: [ :editor | self lspFile source: aString asString ]
]

{ #category : #actions }
GtLSPCoder >> findReferencesIn: textEditor [
	| index |
	textEditor editor cursors do: [ :each | index := each position ].
	index ifNil: [ ^ self ].
	self lspClient
		findReferencesIn: self lspFile filename
		at: (textEditor editor positionFor: index)
		do: [ :items | self showLocationItems: items from: textEditor ]
]

{ #category : #actions }
GtLSPCoder >> gotoDeclarationIn: textEditor [
	| index |
	textEditor editor cursors do: [ :each | index := each position ].
	index ifNil: [ ^ self ].
	self lspClient
		gotoDeclarationIn: self lspFile filename
		at: (textEditor editor positionFor: index)
		do: [ :items | self showLocationItems: items from: textEditor ]
]

{ #category : #actions }
GtLSPCoder >> gotoDefinitionIn: textEditor [
	| index |
	textEditor editor cursors do: [ :each | index := each position ].
	index ifNil: [ ^ self ].
	self lspClient
		gotoDefinitionIn: self lspFile filename
		at: (textEditor editor positionFor: index)
		do: [ :items | self showLocationItems: items from: textEditor ]
]

{ #category : #actions }
GtLSPCoder >> gotoTypeDefinitionIn: textEditor [
	| index |
	textEditor editor cursors do: [ :each | index := each position ].
	index ifNil: [ ^ self ].
	self lspClient
		gotoTypeDefinitionIn: self lspFile filename
		at: (textEditor editor positionFor: index)
		do: [ :items | self showLocationItems: items from: textEditor ]
]

{ #category : #initialization }
GtLSPCoder >> initialize [
	super initialize.
	preventUpdates := false.
	self matchParent.
	self initializeSidebar.
	self initializeContent.
	self addChild: sidebarElement as: #sidebar.
	self addChild: contentElement as: #content
]

{ #category : #initialization }
GtLSPCoder >> initializeContent [
	contentElement := BrHorizontalPane new
			margin: (BlInsets all: 5);
			matchParent
]

{ #category : #initialization }
GtLSPCoder >> initializeSidebar [
	sidebarElement := GtPhlowHorizontalSidebarElement new
			beLeft;
			matchParent;
			background: BrGlamorousColors neutralBackgroundColor.
	self
		addAptitude: (GtPhlowToolDetailAptitude new
				normal: [ :aStyle | aStyle do: [ sidebarElement hide ] ];
				detailed: [ :aStyle | aStyle do: [ sidebarElement show ] ]).
	sidebarElement hide
]

{ #category : #updating }
GtLSPCoder >> lspClient [
	^ self lspFile lspClient
]

{ #category : #updating }
GtLSPCoder >> lspDirectory [
	^ lspObject lspDirectory
]

{ #category : #accessing }
GtLSPCoder >> lspFile [
	^ lspObject lspFile
]

{ #category : #accessing }
GtLSPCoder >> modificationColor [
	^ self lspFile isModified
		ifTrue: [ self theme status changesBackgroundColor ]
		ifFalse: [ Color transparent ]
]

{ #category : #accessing }
GtLSPCoder >> object: anObject [
	lspObject := anObject isLSPDirectory
			ifTrue: [ anObject files isEmpty ifTrue: [ anObject ] ifFalse: [ anObject files first ] ]
			ifFalse: [ anObject ].
	sidebarElement contentStencil: [ self buildSidebarFor: lspObject ]
]

{ #category : #accessing }
GtLSPCoder >> preventSave [
	preventUpdates := true.
	contentElement
		childNamed: #saveAction
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt enabled: false ] ]
]

{ #category : #search }
GtLSPCoder >> searchButtonFor: obj [
	^ (GtSpotterDropdownButtonStencil new
		valuable: [ obj lspDirectory ];
		tooltip: 'Search';
		icon: BrGlamorousVectorIcons search;
		objectActOn: [ :anActOnEvent :anItem | 
			self updateContentsTo: anItem.
			self updateFilesTo: anItem.
			anActOnEvent beActed ]) asElement
]

{ #category : #actions }
GtLSPCoder >> showLocationItems: items from: textEditor [
	| referenceItems |
	items ifNil: [ ^ self ].
	referenceItems := (items
			collect: [ :each | 
				(self lspDirectory fileForUri: each uri)
					ifNotNil: [ :file | 
						GtLSPFileLocation new
							lspFile: file;
							startPosition: each range start;
							endPosition: each range end ] ]) select: #notNil.
	textEditor
		inUIProcessDo: [ textEditor phlow
				spawnObject: (referenceItems size = 1
						ifTrue: [ referenceItems first ]
						ifFalse: [ GtLSPReferenceList new references: referenceItems ]) ]
]

{ #category : #refactoring }
GtLSPCoder >> startRenameIn: textEditor [
	GtLSPRenameRefactoringController new
		editor: textEditor;
		lspFile: self lspFile;
		execute
]

{ #category : #updating }
GtLSPCoder >> updateChangeStatus [
	modified = self lspFile isModified ifTrue: [ ^ self ].
	modified := self lspFile isModified.
	contentElement
		childNamed: #modificationBar
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt background: self modificationColor ] ].
	contentElement
		childNamed: #saveAction
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt enabled: self lspFile isModified ] ].
	contentElement
		childNamed: #cancelAction
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt enabled: self lspFile isModified ] ].
	sidebarElement
		childNamed: #files
		ifFound: [ :files | 
			files
				allChildrenBreadthFirstDetect: [ :each | (each userData at: #lspFile ifAbsent: [  ]) = self lspFile ]
				ifFound: [ :elmt | self updateModifiedIn: elmt ] ]
]

{ #category : #updating }
GtLSPCoder >> updateContentsTo: aLSPObject [
	| textEditor content fileToolbar titleContent |
	(lspObject notNil
		and: [ lspObject isLSPReference and: [ lspObject lspFile = aLSPObject ] ])
		ifTrue: [ ^ self ].
	modified := nil.
	lspObject := aLSPObject.
	self lspFile announcer weak
		when: GtLSPFileSaved
			send: #updateChangeStatus
			to: self;
		when: GtLSPFileSourceChanged
			send: #updateChangeStatus
			to: self;
		when: GtLSPFileDiagnostics
			send: #updateDiagnostics
			to: self.
	self lspDirectory announcer weak
		when: GtLSPFileAdded
			send: #updateTrees
			to: self;
		when: GtLSPFileDeleted
			send: #updateTrees
			to: self.
	contentElement removeChildren.
	contentElement
		addChild: (BlElement new
				width: 5;
				constraintsDo: [ :c | c vertical matchParent ];
				yourself)
		as: #modificationBar.
	textEditor := lspObject editor.
	textEditor
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombination primaryS;
				action: [ aLSPObject saveFile ]);
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombination primaryN;
				action: [ self findReferencesIn: textEditor ]);
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombination primaryM;
				action: [ self gotoDefinitionIn: textEditor ]);
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombinationBuilder new primary shift m build;
				action: [ self gotoDeclarationIn: textEditor ]);
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombination primaryB;
				action: [ self gotoTypeDefinitionIn: textEditor ]);
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombination primaryR;
				action: [ self startRenameIn: textEditor ]).
	lspObject addShortcutsTo: textEditor inCoder: self.
	textEditor editor
		when: BrTextEditorInsertedEvent
			do: [ :event | self editorChangedTo: event source text asString ];
		when: BrTextEditorDeletedEvent
			do: [ :event | self editorChangedTo: event source text asString ];
		when: BlInfiniteDataSourceChanged
			do: [ :event | self editorChangedTo: event source text asString ].
	content := BrVerticalPane new.
	content matchParent.
	titleContent := BrHorizontalPane new.
	titleContent hMatchParent.
	titleContent vFitContent.
	titleContent
		addChild: (BrVerticalPane new
				fitContent;
				addChild: (BrLabel new
							aptitude: (BrGlamorousLabelAptitude new glamorousRegularFontAndSize
									foreground: Color gray;
									fontSize: 12);
							text: 'File';
							yourself)
					as: #label;
				addChild: (BrLabel new
							aptitude: (BrGlamorousLabelAptitude new
									bold;
									fontSize: 18);
							text: aLSPObject filename basename)
					as: #filename;
				yourself);
		addChild: ((self buildDirectoryToolbarFor: lspObject)
				padding: (BlInsets top: 5);
				constraintsDo: [ :c | 
					c ignoreByLayout.
					c ignored horizontal alignRight.
					c ignored vertical alignTop ];
				yourself).
	content addChild: titleContent.
	content addChild: textEditor as: #editor.
	fileToolbar := self buildToolbarFor: aLSPObject.
	content addChild: fileToolbar as: #toolbar.
	content
		addAptitude: (BrGlamorousWithVerticalScrollbarAptitude new scrollableName: #editor).
	contentElement addChild: content.
	self updateChangeStatus.
	self lspFile diagnostics
		ifNil: [ self lspClient
				requestDiagnosticsFor: self lspFile filename
				do: [ :diags | self lspFile diagnostics: diags ]
				onError: [ self lspFile diagnostics: #() ] ]
		ifNotNil: [ self updateDiagnostics ]
]

{ #category : #updating }
GtLSPCoder >> updateDiagnostics [
	self lspFile diagnostics
		ifNotNil: [ :diagnostics | 
			self
				inUIProcessDo: [ contentElement
						childNamed: #editor
						ifFound: [ :editor | 
							| source text |
							text := editor editor text.
							text
								clearAttributes: 0
								to: text size
								if: [ :each | each class == GtSourceCoderErrorAttribute ].
							(diagnostics select: [ :each | (each severity ifNil: [ 0 ]) <= 2 ])
								ifNotEmpty: [ :diags | 
									source := text asString.
									(diags
										groupedBy: [ :each | 
											(source gtIndexOfLineNumber: each range end line + 1)
												ifNotNil: [ :location | 
													| end index |
													end := each range end character.
													index := location key.
													[ end > 0 and: [ index <= source size ] ]
														whileTrue: [ end := end - (editor editor characterSizeOf: (source at: index)).
															index := index + 1 ].
													index ] ])
										keysAndValuesDo: [ :index :items | 
											text
												attributes: {(GtSourceCoderErrorAttribute
															for: (String
																	streamContents: [ :stream | items do: [ :each | stream << each message ] separatedBy: [ stream cr ] ]))
															openOnFirstShow: false;
															beNotOverwritableByStyler}
												from: index - 1
												to: index - 1 ] ] ] ] ]
]

{ #category : #updating }
GtLSPCoder >> updateFileTreeItems: tree [
	tree
		items: {{self lspDirectory filename absolutePath asFileReference.
						nil}}
			lazy: [ :each | 
				each first isDirectory
					ifTrue: [ (OrderedCollection
							withAll: (each first directories
									collect: [ :dir | 
										{dir.
											nil} ]))
							addAll: ((each first childrenMatching: self lspDirectory extensions)
									collect: [ :file | 
										{file.
											self lspDirectory fileFor: file} ]);
							sort: [ :a :b | a first basename < b first basename ];
							yourself ]
					ifFalse: [ #() ] ];
		expandOneLevel
]

{ #category : #updating }
GtLSPCoder >> updateFilesTo: obj [
	self
		childNamed: #files
		ifFound: [ :tree | 
			tree
				expandSuchThat: [ :each | self lspFile filename isContainedBy: each value first ].
			tree
				selectAndScrollTo: {self lspFile filename.
						self lspFile} ]
]

{ #category : #updating }
GtLSPCoder >> updateModifiedIn: anElement [
	(anElement childNamed: #button)
		visibility: (((anElement userData at: #lspFile ifAbsent: [  ])
				ifNil: [ false ]
				ifNotNil: [ :file | file isModified ])
				ifTrue: [ BlVisibility visible ]
				ifFalse: [ BlVisibility gone ])
]

{ #category : #updating }
GtLSPCoder >> updateTrees [
	self lspFile ifNil: [ ^ self ].
	self
		inUIProcessDo: [ self
				childNamed: #files
				ifFound: [ :tree | 
					self updateFileTreeItems: tree.
					self updateFilesTo: self lspFile ] ]
]
