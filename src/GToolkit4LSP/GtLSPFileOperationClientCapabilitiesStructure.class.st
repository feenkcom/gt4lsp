Class {
	#name : #GtLSPFileOperationClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> didCreate [
	"The client has support for sending didCreateFiles notifications."

	^ data at: 'didCreate' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> didCreate: anObject [
	data at: 'didCreate' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> didDelete [
	"The client has support for sending didDeleteFiles notifications."

	^ data at: 'didDelete' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> didDelete: anObject [
	data at: 'didDelete' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> didRename [
	"The client has support for sending didRenameFiles notifications."

	^ data at: 'didRename' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> didRename: anObject [
	data at: 'didRename' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> dynamicRegistration [
	"Whether the client supports dynamic registration for file requests/notifications."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> willCreate [
	"The client has support for sending willCreateFiles requests."

	^ data at: 'willCreate' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> willCreate: anObject [
	data at: 'willCreate' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> willDelete [
	"The client has support for sending willDeleteFiles requests."

	^ data at: 'willDelete' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> willDelete: anObject [
	data at: 'willDelete' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> willRename [
	"The client has support for sending willRenameFiles requests."

	^ data at: 'willRename' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFileOperationClientCapabilitiesStructure >> willRename: anObject [
	data at: 'willRename' put:  (self objectFor: anObject)
]
