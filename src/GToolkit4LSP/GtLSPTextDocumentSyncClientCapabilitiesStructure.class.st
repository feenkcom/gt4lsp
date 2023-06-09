Class {
	#name : #GtLSPTextDocumentSyncClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPTextDocumentSyncClientCapabilitiesStructure >> didSave [
	"The client supports did save notifications."

	^ data at: 'didSave'
]

{ #category : #accessing }
GtLSPTextDocumentSyncClientCapabilitiesStructure >> didSave: anObject [
	data at: 'didSave' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentSyncClientCapabilitiesStructure >> dynamicRegistration [
	"Whether text document synchronization supports dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPTextDocumentSyncClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentSyncClientCapabilitiesStructure >> willSave [
	"The client supports sending will save notifications."

	^ data at: 'willSave'
]

{ #category : #accessing }
GtLSPTextDocumentSyncClientCapabilitiesStructure >> willSave: anObject [
	data at: 'willSave' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTextDocumentSyncClientCapabilitiesStructure >> willSaveWaitUntil [
	"The client supports sending a will save request and
waits for a response providing text edits which will
be applied to the document before it is saved."

	^ data at: 'willSaveWaitUntil'
]

{ #category : #accessing }
GtLSPTextDocumentSyncClientCapabilitiesStructure >> willSaveWaitUntil: anObject [
	data at: 'willSaveWaitUntil' put:  (self objectFor: anObject)
]
