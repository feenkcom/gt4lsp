Class {
	#name : #GtLSPParameterInformationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPParameterInformationStructure >> documentation [
	"The human-readable doc-comment of this parameter. Will be shown
in the UI but can be omitted."

	^ data at: 'documentation'
]

{ #category : #accessing }
GtLSPParameterInformationStructure >> documentation: anObject [
	data at: 'documentation' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPParameterInformationStructure >> label [
	"The label of this parameter information.

Either a string or an inclusive start and exclusive end offsets within its containing
signature label. (see SignatureInformation.label). The offsets are based on a UTF-16
string representation as `Position` and `Range` does.

*Note*: a label of type string should be a substring of its containing signature label.
Its intended use case is to highlight the parameter label part in the `SignatureInformation.label`."

	^ data at: 'label'
]

{ #category : #accessing }
GtLSPParameterInformationStructure >> label: anObject [
	data at: 'label' put:  (self objectFor: anObject)
]
