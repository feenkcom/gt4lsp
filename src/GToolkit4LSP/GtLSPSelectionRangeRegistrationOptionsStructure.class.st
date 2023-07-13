Class {
	#name : #GtLSPSelectionRangeRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSelectionRangeRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPSelectionRangeRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSelectionRangeRegistrationOptionsStructure >> id [
	"The id used to register the request. The id can be used to deregister
the request again. See also Registration#id."

	^ data at: 'id' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSelectionRangeRegistrationOptionsStructure >> id: anObject [
	data at: 'id' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSelectionRangeRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSelectionRangeRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
