Class {
	#name : #GtLSPFileOperationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> didCreate [
	"The server is interested in receiving didCreateFiles notifications."

	^ (data at: 'didCreate') ifNotNil: [ :obj | GtLSPFileOperationRegistrationOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> didCreate: anObject [
	data at: 'didCreate' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> didDelete [
	"The server is interested in receiving didDeleteFiles file notifications."

	^ (data at: 'didDelete') ifNotNil: [ :obj | GtLSPFileOperationRegistrationOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> didDelete: anObject [
	data at: 'didDelete' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> didRename [
	"The server is interested in receiving didRenameFiles notifications."

	^ (data at: 'didRename') ifNotNil: [ :obj | GtLSPFileOperationRegistrationOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> didRename: anObject [
	data at: 'didRename' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> willCreate [
	"The server is interested in receiving willCreateFiles requests."

	^ (data at: 'willCreate') ifNotNil: [ :obj | GtLSPFileOperationRegistrationOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> willCreate: anObject [
	data at: 'willCreate' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> willDelete [
	"The server is interested in receiving willDeleteFiles file requests."

	^ (data at: 'willDelete') ifNotNil: [ :obj | GtLSPFileOperationRegistrationOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> willDelete: anObject [
	data at: 'willDelete' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> willRename [
	"The server is interested in receiving willRenameFiles requests."

	^ (data at: 'willRename') ifNotNil: [ :obj | GtLSPFileOperationRegistrationOptionsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPFileOperationOptionsStructure >> willRename: anObject [
	data at: 'willRename' put:  (self objectFor: anObject)
]
