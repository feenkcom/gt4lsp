Class {
	#name : #GtLSPDocumentSymbolOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDocumentSymbolOptionsStructure >> label [
	"A human-readable string that is shown when multiple outlines trees
are shown for the same document.

@since 3.16.0"

	^ data at: 'label'
]

{ #category : #accessing }
GtLSPDocumentSymbolOptionsStructure >> label: anObject [
	data at: 'label' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentSymbolOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress'
]

{ #category : #accessing }
GtLSPDocumentSymbolOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
