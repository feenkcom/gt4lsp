Class {
	#name : #GtLSPCoder,
	#superclass : #BrHorizontalPane,
	#instVars : [
		'sidebarElement',
		'contentElement',
		'lspClient',
		'lspFile',
		'modified'
	],
	#category : #'GToolkit4LSP-View'
}

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
	contentElement
		childNamed: #editor
		ifFound: [ :editor | lspFile source: aString asString ]
]

{ #category : #initialization }
GtLSPCoder >> initialize [
	super initialize.
	self matchParent.
	self initializeSidebar.
	self initializeContent.
	self addChild: sidebarElement as: #sidebar.
	self addChild: contentElement as: #content
]

{ #category : #initialization }
GtLSPCoder >> initializeContent [
	contentElement := BrHorizontalPane new
			background: Color white;
			aptitude: BrShadowAptitude new
					+ (BrStyleCommonAptitude new
							default: [ :aStyle | BlBorder paint: self theme default lightBorderColor width: 1 ];
							focused: [ :aStyle | 
								BlBorder
									paint: (self theme default primaryBorderColor alpha: 0.4) gtOpaqueColorOnWhite
									width: 1 ]);
			margin: (BlInsets all: 5);
			hMatchParent;
			vFitContentLimited
]

{ #category : #initialization }
GtLSPCoder >> initializeSidebar [
	sidebarElement := GtPhlowHorizontalSidebarElement new
			beLeft;
			matchParent;
			background: BrGlamorousColors neutralBackgroundColor.
	self
		addAptitude: (GtPhlowToolDetailAptitude new
				normal: [ :theInstance | sidebarElement hide ];
				detailed: [ :theInstance | sidebarElement show ]).
	sidebarElement hide
]

{ #category : #accessing }
GtLSPCoder >> modificationColor [
	^ lspFile isModified
		ifTrue: [ self theme status changesBackgroundColor ]
		ifFalse: [ Color transparent ]
]

{ #category : #accessing }
GtLSPCoder >> object: anObject [
	lspFile := anObject isLSPDirectory
			ifTrue: [ anObject files isEmpty ifTrue: [ anObject ] ifFalse: [ anObject files first ] ]
			ifFalse: [ anObject ].
	sidebarElement contentStencil: [ self buildSidebarFor: lspFile ]
]

{ #category : #search }
GtLSPCoder >> searchButtonFor: obj [
	^ (GtSpotterDropdownButtonStencil new
		valuable: [ obj lspDirectory ];
		tooltip: 'Search';
		icon: BrGlamorousVectorIcons search;
		actOn: [ :anActOnEvent :anItem | 
			self updateFilesTo: anItem.
			self updateContentsTo: anItem.
			anActOnEvent beActed ]) asElement
]

{ #category : #updating }
GtLSPCoder >> updateChangeStatus [
	modified = lspFile isModified ifTrue: [ ^ self ].
	modified := lspFile isModified.
	contentElement
		childNamed: #modificationBar
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt background: self modificationColor ] ].
	contentElement
		childNamed: #saveButton
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt enabled: lspFile isModified ] ].
	contentElement
		childNamed: #cancelButton
		ifFound: [ :elmt | elmt inUIProcessDo: [ elmt enabled: lspFile isModified ] ].
	sidebarElement
		childNamed: #files
		ifFound: [ :files | 
			files
				allChildrenBreadthFirstDetect: [ :each | (each userData at: #lexiconFile ifAbsent: [  ]) = lspFile ]
				ifFound: [ :elmt | self updateModifiedIn: elmt ] ]
]

{ #category : #updating }
GtLSPCoder >> updateContentsTo: aLSPFile [
	| textEditor content toolbar |
	modified := nil.
	lspFile := aLSPFile.
	lspFile announcer weak
		when: GtLSPFileSaved
			send: #updateChangeStatus
			to: self;
		when: GtLSPFileSourceChanged
			send: #updateChangeStatus
			to: self.
	lspFile lspDirectory announcer weak
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
	textEditor := lspFile editor.
	textEditor
		addShortcut: (BlShortcutWithAction new
				combination: BlKeyCombination primaryS;
				action: [ aLSPFile saveFile ]).
	textEditor editor
		when: BrTextEditorInsertedEvent
			do: [ :event | self editorChangedTo: event source text asString ];
		when: BrTextEditorDeletedEvent
			do: [ :event | self editorChangedTo: event source text asString ];
		when: BlInfiniteDataSourceChanged
			do: [ :event | self editorChangedTo: event source text asString ].
	content := BrVerticalPane new.
	content hMatchParent.
	content vFitContentLimited.
	content
		addChild: (BrLabel new
				aptitude: (BrGlamorousLabelAptitude new glamorousRegularFontAndSize
						foreground: Color gray;
						fontSize: 12);
				text: 'Lexicon file';
				yourself)
		as: #label.
	content
		addChild: (BrLabel new
				aptitude: (BrGlamorousLabelAptitude new
						bold;
						fontSize: 18);
				text: aLSPFile filename basename)
		as: #filename.
	content addChild: textEditor as: #editor.
	toolbar := BrToolbar new
			aptitude: (BrGlamorousToolbarAptitude new spacing: 5);
			fitContent;
			margin: (BlInsets bottom: 5).
	toolbar
		addChild: (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				beSmallSize;
				icon: BrGlamorousVectorIcons accept;
				label: 'Save';
				action: [ aLSPFile saveFile ])
		as: #saveButton.
	toolbar
		addChild: (BrButton new
				aptitude: BrGlamorousButtonWithIconAptitude;
				beSmallSize;
				icon: BrGlamorousVectorIcons cancel;
				label: 'Cancel';
				action: [ aLSPFile cancel ])
		as: #cancelButton.
	content addChild: toolbar as: #toolbar.
	contentElement addChild: content.
	self updateChangeStatus
]

{ #category : #updating }
GtLSPCoder >> updateFileTreeItems: tree [
	tree
		items: {{lspFile lspDirectory filename absolutePath asFileReference.
						nil}}
			lazy: [ :each | 
				each first isDirectory
					ifTrue: [ (OrderedCollection
							withAll: (each first directories
									collect: [ :dir | 
										{dir.
											nil} ]))
							addAll: ((each first childrenMatching: lspFile lspDirectory extensions)
									collect: [ :file | 
										{file.
											lspFile lspDirectory fileFor: file} ]);
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
				expandSuchThat: [ :each | lspFile filename isContainedBy: each value first ].
			tree
				selectAndScrollTo: {lspFile filename.
						lspFile} ]
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
	lspFile ifNil: [ ^ self ].
	self
		inUIProcessDo: [ self
				childNamed: #files
				ifFound: [ :tree | 
					self updateFileTreeItems: tree.
					self updateFilesTo: lspFile ] ]
]
