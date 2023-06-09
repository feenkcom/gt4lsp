Class {
	#name : #GtLSPDidChangeWorkspaceFoldersParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDidChangeWorkspaceFoldersParamsStructure >> create [
	data at: 'event' put: GtLSPWorkspaceFoldersChangeEventStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDidChangeWorkspaceFoldersParamsStructure >> event [
	"The actual workspace folder change event."

	^ (data at: 'event') ifNotNil: [ :obj | GtLSPWorkspaceFoldersChangeEventStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDidChangeWorkspaceFoldersParamsStructure >> event: anObject [
	data at: 'event' put:  (self objectFor: anObject)
]
