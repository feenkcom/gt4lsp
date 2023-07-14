Class {
	#name : #GtLSPNotebookDocumentSyncRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPNotebookDocumentSyncRegistrationOptionsStructure >> create [
	data at: 'notebookSelector' put: #()
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncRegistrationOptionsStructure >> id [
	"The id used to register the request. The id can be used to deregister
the request again. See also Registration#id."

	^ data at: 'id' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncRegistrationOptionsStructure >> id: anObject [
	data at: 'id' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncRegistrationOptionsStructure >> notebookSelector [
	"The notebooks to be synced"

	^ data at: 'notebookSelector'
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncRegistrationOptionsStructure >> notebookSelector: anObject [
	data at: 'notebookSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncRegistrationOptionsStructure >> save [
	"Whether save notification should be forwarded to
the server. Will only be honored if mode === `notebook`."

	^ data at: 'save' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncRegistrationOptionsStructure >> save: anObject [
	data at: 'save' put:  (self objectFor: anObject)
]
