Class {
	#name : #GtLSPDocumentColorRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentColorRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPDocumentColorRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentColorRegistrationOptionsStructure >> id [
	"The id used to register the request. The id can be used to deregister
the request again. See also Registration#id."

	^ data at: 'id'
]

{ #category : #accessing }
GtLSPDocumentColorRegistrationOptionsStructure >> id: anObject [
	data at: 'id' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentColorRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPDocumentColorRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]