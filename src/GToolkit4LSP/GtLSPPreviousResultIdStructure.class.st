Class {
	#name : #GtLSPPreviousResultIdStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPPreviousResultIdStructure >> uri [
	"The URI for which the client knowns a
result id."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPPreviousResultIdStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPPreviousResultIdStructure >> value [
	"The value of the previous result id."

	^ data at: 'value'
]

{ #category : #accessing }
GtLSPPreviousResultIdStructure >> value: anObject [
	data at: 'value' put:  (self objectFor: anObject)
]
