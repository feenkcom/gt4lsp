Class {
	#name : #GtLSPDocumentSymbolRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentSymbolRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPDocumentSymbolRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolRegistrationOptionsStructure >> label [
	"A human-readable string that is shown when multiple outlines trees
are shown for the same document.

@since 3.16.0"

	^ data at: 'label' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentSymbolRegistrationOptionsStructure >> label: anObject [
	data at: 'label' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDocumentSymbolRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
