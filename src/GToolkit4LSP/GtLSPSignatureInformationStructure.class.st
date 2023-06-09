Class {
	#name : #GtLSPSignatureInformationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSignatureInformationStructure >> activeParameter [
	"The index of the active parameter.

If provided, this is used in place of `SignatureHelp.activeParameter`.

@since 3.16.0"

	^ data at: 'activeParameter'
]

{ #category : #accessing }
GtLSPSignatureInformationStructure >> activeParameter: anObject [
	data at: 'activeParameter' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureInformationStructure >> documentation [
	"The human-readable doc-comment of this signature. Will be shown
in the UI but can be omitted."

	^ data at: 'documentation'
]

{ #category : #accessing }
GtLSPSignatureInformationStructure >> documentation: anObject [
	data at: 'documentation' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureInformationStructure >> label [
	"The label of this signature. Will be shown in
the UI."

	^ data at: 'label'
]

{ #category : #accessing }
GtLSPSignatureInformationStructure >> label: anObject [
	data at: 'label' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureInformationStructure >> parameters [
	"The parameters of this signature."

	^ data at: 'parameters'
]

{ #category : #accessing }
GtLSPSignatureInformationStructure >> parameters: anObject [
	data at: 'parameters' put:  (self objectFor: anObject)
]
