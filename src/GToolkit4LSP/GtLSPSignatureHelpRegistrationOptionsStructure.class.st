Class {
	#name : #GtLSPSignatureHelpRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSignatureHelpRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPSignatureHelpRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpRegistrationOptionsStructure >> retriggerCharacters [
	"List of characters that re-trigger signature help.

These trigger characters are only active when signature help is already showing. All trigger characters
are also counted as re-trigger characters.

@since 3.15.0"

	^ data at: 'retriggerCharacters'
]

{ #category : #accessing }
GtLSPSignatureHelpRegistrationOptionsStructure >> retriggerCharacters: anObject [
	data at: 'retriggerCharacters' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpRegistrationOptionsStructure >> triggerCharacters [
	"List of characters that trigger signature help automatically."

	^ data at: 'triggerCharacters'
]

{ #category : #accessing }
GtLSPSignatureHelpRegistrationOptionsStructure >> triggerCharacters: anObject [
	data at: 'triggerCharacters' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPSignatureHelpRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
