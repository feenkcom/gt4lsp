Class {
	#name : #GtLSPDidChangeWatchedFilesRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDidChangeWatchedFilesRegistrationOptionsStructure >> create [
	data at: 'watchers' put: #()
]

{ #category : #accessing }
GtLSPDidChangeWatchedFilesRegistrationOptionsStructure >> watchers [
	"The watchers to register."

	^ data at: 'watchers'
]

{ #category : #accessing }
GtLSPDidChangeWatchedFilesRegistrationOptionsStructure >> watchers: anObject [
	data at: 'watchers' put:  (self objectFor: anObject)
]
