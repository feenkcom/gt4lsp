Class {
	#name : #GtLSPRenameRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPRenameRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPRenameRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameRegistrationOptionsStructure >> prepareProvider [
	"Renames should be checked and tested before being executed.

@since version 3.12.0"

	^ data at: 'prepareProvider'
]

{ #category : #accessing }
GtLSPRenameRegistrationOptionsStructure >> prepareProvider: anObject [
	data at: 'prepareProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPRenameRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPRenameRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
