Class {
	#name : #GtLSPTextDocumentSyncOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> change [
	"Change notifications are sent to the server. See TextDocumentSyncKind.None, TextDocumentSyncKind.Full
and TextDocumentSyncKind.Incremental. If omitted it defaults to TextDocumentSyncKind.None."

	^ data at: 'change' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> change: anObject [
	data at: 'change' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> openClose [
	"Open and close notifications are sent to the server. If omitted open close notification should not
be sent."

	^ data at: 'openClose' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> openClose: anObject [
	data at: 'openClose' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> save [
	"If present save notifications are sent to the server. If omitted the notification should not be
sent."

	^ data at: 'save' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> save: anObject [
	data at: 'save' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> willSave [
	"If present will save notifications are sent to the server. If omitted the notification should not be
sent."

	^ data at: 'willSave' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> willSave: anObject [
	data at: 'willSave' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> willSaveWaitUntil [
	"If present will save wait until requests are sent to the server. If omitted the request should not be
sent."

	^ data at: 'willSaveWaitUntil' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTextDocumentSyncOptionsStructure >> willSaveWaitUntil: anObject [
	data at: 'willSaveWaitUntil' put:  (self objectFor: anObject)
]
