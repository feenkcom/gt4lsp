Class {
	#name : #GtLSPSignatureHelpOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSignatureHelpOptionsStructure >> retriggerCharacters [
	"List of characters that re-trigger signature help.

These trigger characters are only active when signature help is already showing. All trigger characters
are also counted as re-trigger characters.

@since 3.15.0"

	^ data at: 'retriggerCharacters'
]

{ #category : #accessing }
GtLSPSignatureHelpOptionsStructure >> retriggerCharacters: anObject [
	data at: 'retriggerCharacters' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpOptionsStructure >> triggerCharacters [
	"List of characters that trigger signature help automatically."

	^ data at: 'triggerCharacters'
]

{ #category : #accessing }
GtLSPSignatureHelpOptionsStructure >> triggerCharacters: anObject [
	data at: 'triggerCharacters' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPSignatureHelpOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
