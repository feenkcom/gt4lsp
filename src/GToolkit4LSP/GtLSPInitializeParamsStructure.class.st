Class {
	#name : #GtLSPInitializeParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInitializeParamsStructure >> capabilities [
	"The capabilities provided by the client (editor or tool)"

	^ (data at: 'capabilities') ifNotNil: [ :obj | GtLSPClientCapabilitiesStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> capabilities: anObject [
	data at: 'capabilities' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> clientInfo [
	"Information about the client

@since 3.15.0"

	^ data at: 'clientInfo'
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> clientInfo: anObject [
	data at: 'clientInfo' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPInitializeParamsStructure >> create [
	data
		at: 'capabilities'
		put: GtLSPClientCapabilitiesStructure create asDictionary
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> initializationOptions [
	"User provided initialization options."

	^ data at: 'initializationOptions'
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> initializationOptions: anObject [
	data at: 'initializationOptions' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> locale [
	"The locale the client is currently showing the user interface
in. This must not necessarily be the locale of the operating
system.

Uses IETF language tags as the value's syntax
(See https://en.wikipedia.org/wiki/IETF_language_tag)

@since 3.16.0"

	^ data at: 'locale'
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> locale: anObject [
	data at: 'locale' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> processId [
	"The process Id of the parent process that started
the server.

Is `null` if the process has not been started by another process.
If the parent process is not alive then the server should exit."

	^ data at: 'processId'
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> processId: anObject [
	data at: 'processId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> rootPath [
	"The rootPath of the workspace. Is null
if no folder is open.

@deprecated in favour of rootUri."

	^ data at: 'rootPath'
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> rootPath: anObject [
	data at: 'rootPath' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> rootUri [
	"The rootUri of the workspace. Is null if no
folder is open. If both `rootPath` and `rootUri` are set
`rootUri` wins.

@deprecated in favour of workspaceFolders."

	^ data at: 'rootUri'
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> rootUri: anObject [
	data at: 'rootUri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> trace [
	"The initial trace setting. If omitted trace is disabled ('off')."

	^ data at: 'trace'
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> trace: anObject [
	data at: 'trace' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken'
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> workspaceFolders [
	"The workspace folders configured in the client when the server starts.

This property is only available if the client supports workspace folders.
It can be `null` if the client supports workspace folders but none are
configured.

@since 3.6.0"

	^ data at: 'workspaceFolders'
]

{ #category : #accessing }
GtLSPInitializeParamsStructure >> workspaceFolders: anObject [
	data at: 'workspaceFolders' put:  (self objectFor: anObject)
]
