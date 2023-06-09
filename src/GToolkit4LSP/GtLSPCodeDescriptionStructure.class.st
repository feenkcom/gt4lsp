Class {
	#name : #GtLSPCodeDescriptionStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCodeDescriptionStructure >> href [
	"An URI to open with more information about the diagnostic error."

	^ data at: 'href'
]

{ #category : #accessing }
GtLSPCodeDescriptionStructure >> href: anObject [
	data at: 'href' put:  (self objectFor: anObject)
]
