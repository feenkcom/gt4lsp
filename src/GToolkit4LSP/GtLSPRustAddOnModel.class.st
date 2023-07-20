Class {
	#name : #GtLSPRustAddOnModel,
	#superclass : #GtLSPRustModel,
	#category : #'GToolkit4LSP-Model'
}

{ #category : #private }
GtLSPRustAddOnModel class >> addUserFinderDirectory: aString [
	FFILibraryFinder
		allSubclassesDo: [ :each | each current userPaths: {aString} , each current userPaths ]
]

{ #category : #accessing }
GtLSPRustAddOnModel class >> commandLine [
	<commandline>
	^ self commandLineCommand
		meaning: [ :args | self processCommandLineArgs: args ]
]

{ #category : #accessing }
GtLSPRustAddOnModel class >> commandLineCommand [
	^ (ClapCommand id: #addOnTestImage)
		description: 'Run the add-on test image';
		add: ClapFlag forHelp;
		add: ((ClapFlag id: #log) description: 'Enable logging to stdout');
		add: ((ClapFlag id: #serverSocketAddress)
				description: 'The server socket address on which to connect for requests';
				add: (ClapPositional id: #address);
				yourself);
		add: ((ClapFlag id: #libraryDirectory)
				description: 'The add-on library directory';
				add: (ClapPositional id: #directory);
				yourself);
		yourself
]

{ #category : #private }
GtLSPRustAddOnModel class >> processCommandLineArgs: args [
	| worker serverSocketAddress |
	args
		at: #help
		ifPresent: [ :help | 
			help value.
			help context exitSuccess ].
	args
		at: #libraryDirectory
		ifPresent: [ :arg | self addUserFinderDirectory: (arg at: #directory) value ].
	serverSocketAddress := ((args at: #serverSocketAddress) at: #address) value.
	StringSignal emit: 'Server address: ' , serverSocketAddress.
	worker := GtRrWorker new.
	worker connectionStrategy socketAddress: serverSocketAddress.
	worker attributes at: #changesSync put: true.
	worker start.
	Semaphore new wait
]

{ #category : #accessing }
GtLSPRustAddOnModel >> gtSpawnAddOnAction [
	<gtLSPToolbarAction>
	^ GtLSPCoderAction new
		action: [ :button | 
			button disable.
			[ [ self spawnImage ] ensure: [ button inUIProcessDo: [ button enable ] ] ]
				fork ];
		title: 'Test';
		icon: BrGlamorousVectorIcons playinspect;
		order: 30
]

{ #category : #accessing }
GtLSPRustAddOnModel >> spawnImage [
	| process runner |
	runner := GtRemoteRunner new
			managerStartupAndShutdown: GtRrManualManagerStartupAndShutdown new;
			startLogging;
			start.
	process := GtSubprocessWithInMemoryOutput new.
	process command: GtVirtualMachine instance headlessExecutable fullName.
	process
		arguments: {'--interactive'.
				SmalltalkImage current imageFile fullName.
				'clap'.
				'addOnTestImage'.
				'--serverSocketAddress'.
				runner port printString.
				'--libraryDirectory'.
				(self filename / 'target' / 'debug') fullName.
				'--detachChangesFromFileSystem'.
				'--noLepiterReload'.
				'--noGtImageUpdate'}.
	process runAndWait.
	runner stop
]
