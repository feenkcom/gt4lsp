Class {
	#name : #GtLSPCodeActionContextStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPCodeActionContextStructure >> create [
	data at: 'diagnostics' put: #()
]

{ #category : #accessing }
GtLSPCodeActionContextStructure >> diagnostics [
	"An array of diagnostics known on the client side overlapping the range provided to the
`textDocument/codeAction` request. They are provided so that the server knows which
errors are currently presented to the user for the given range. There is no guarantee
that these accurately reflect the error state of the resource. The primary parameter
to compute code actions is the provided range."

	^ data at: 'diagnostics'
]

{ #category : #accessing }
GtLSPCodeActionContextStructure >> diagnostics: anObject [
	data at: 'diagnostics' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionContextStructure >> only [
	"Requested kind of actions to return.

Actions not of this kind are filtered out by the client before being shown. So servers
can omit computing them."

	^ data at: 'only'
]

{ #category : #accessing }
GtLSPCodeActionContextStructure >> only: anObject [
	data at: 'only' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCodeActionContextStructure >> triggerKind [
	"The reason why code actions were requested.

@since 3.17.0"

	^ data at: 'triggerKind'
]

{ #category : #accessing }
GtLSPCodeActionContextStructure >> triggerKind: anObject [
	data at: 'triggerKind' put:  (self objectFor: anObject)
]
