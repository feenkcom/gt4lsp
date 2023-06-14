Class {
	#name : #GtLSPTextDocumentSyncKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPTextDocumentSyncKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('None' 0 'Documents should not be synced at all.')
		#('Full' 1 'Documents are synced by always sending the full content
of the document.')
		#('Incremental' 2 'Documents are synced by sending the full content on open.
After that only incremental updates to the document are
send.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
