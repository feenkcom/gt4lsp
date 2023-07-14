Class {
	#name : #'GtLSP_InitializeParamsStructure',
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> capabilities [
	"The capabilities provided by the client (editor or tool)"

	^ (data at: 'capabilities') ifNotNil: [ :obj | GtLSPClientCapabilitiesStructure on: obj ]
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> capabilities: anObject [
	data at: 'capabilities' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> clientInfo [
	"Information about the client

@since 3.15.0"

	^ data at: 'clientInfo' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> clientInfo: anObject [
	data at: 'clientInfo' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSP_InitializeParamsStructure >> create [
	data at: 'capabilities' put: GtLSPClientCapabilitiesStructure create  asDictionary
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> initializationOptions [
	"User provided initialization options."

	^ data at: 'initializationOptions' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> initializationOptions: anObject [
	data at: 'initializationOptions' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> locale [
	"The locale the client is currently showing the user interface
in. This must not necessarily be the locale of the operating
system.

Uses IETF language tags as the value's syntax
(See https://en.wikipedia.org/wiki/IETF_language_tag)

@since 3.16.0"

	^ data at: 'locale' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> locale: anObject [
	data at: 'locale' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> processId [
	"The process Id of the parent process that started
the server.

Is `null` if the process has not been started by another process.
If the parent process is not alive then the server should exit."

	^ data at: 'processId'
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> processId: anObject [
	data at: 'processId' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> rootPath [
	"The rootPath of the workspace. Is null
if no folder is open.

@deprecated in favour of rootUri."

	^ data at: 'rootPath' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> rootPath: anObject [
	data at: 'rootPath' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> rootUri [
	"The rootUri of the workspace. Is null if no
folder is open. If both `rootPath` and `rootUri` are set
`rootUri` wins.

@deprecated in favour of workspaceFolders."

	^ data at: 'rootUri'
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> rootUri: anObject [
	data at: 'rootUri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> trace [
	"The initial trace setting. If omitted trace is disabled ('off')."

	^ data at: 'trace' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> trace: anObject [
	data at: 'trace' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSP_InitializeParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
