Class {
	#name : #GtLSPSignatureHelpStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPSignatureHelpStructure >> activeParameter [
	"The active parameter of the active signature. If omitted or the value
lies outside the range of `signatures[activeSignature].parameters`
defaults to 0 if the active signature has parameters. If
the active signature has no parameters it is ignored.
In future version of the protocol this property might become
mandatory to better express the active parameter if the
active signature does have any."

	^ data at: 'activeParameter' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSignatureHelpStructure >> activeParameter: anObject [
	data at: 'activeParameter' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPSignatureHelpStructure >> activeSignature [
	"The active signature. If omitted or the value lies outside the
range of `signatures` the value defaults to zero or is ignored if
the `SignatureHelp` has no signatures.

Whenever possible implementors should make an active decision about
the active signature and shouldn't rely on a default value.

In future version of the protocol this property might become
mandatory to better express this."

	^ data at: 'activeSignature' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPSignatureHelpStructure >> activeSignature: anObject [
	data at: 'activeSignature' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPSignatureHelpStructure >> create [
	data at: 'signatures' put: #()
]

{ #category : #accessing }
GtLSPSignatureHelpStructure >> signatures [
	"One or more signatures."

	^ data at: 'signatures'
]

{ #category : #accessing }
GtLSPSignatureHelpStructure >> signatures: anObject [
	data at: 'signatures' put:  (self objectFor: anObject)
]
