Class {
	#name : #GtLSPFileSystemWatcherStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFileSystemWatcherStructure >> globPattern [
	"The glob pattern to watch. See {@link GlobPattern glob pattern} for more detail.

@since 3.17.0 support for relative patterns."

	^ data at: 'globPattern'
]

{ #category : #accessing }
GtLSPFileSystemWatcherStructure >> globPattern: anObject [
	data at: 'globPattern' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileSystemWatcherStructure >> kind [
	"The kind of events of interest. If omitted it defaults
to WatchKind.Create | WatchKind.Change | WatchKind.Delete
which is 7."

	^ data at: 'kind' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFileSystemWatcherStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]
