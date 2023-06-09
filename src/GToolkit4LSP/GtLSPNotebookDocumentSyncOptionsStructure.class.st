Class {
	#name : #GtLSPNotebookDocumentSyncOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPNotebookDocumentSyncOptionsStructure >> create [
	data at: 'notebookSelector' put: #()
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncOptionsStructure >> notebookSelector [
	"The notebooks to be synced"

	^ data at: 'notebookSelector'
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncOptionsStructure >> notebookSelector: anObject [
	data at: 'notebookSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncOptionsStructure >> save [
	"Whether save notification should be forwarded to
the server. Will only be honored if mode === `notebook`."

	^ data at: 'save'
]

{ #category : #accessing }
GtLSPNotebookDocumentSyncOptionsStructure >> save: anObject [
	data at: 'save' put:  (self objectFor: anObject)
]
