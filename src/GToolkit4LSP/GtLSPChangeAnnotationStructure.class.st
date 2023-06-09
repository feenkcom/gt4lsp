Class {
	#name : #GtLSPChangeAnnotationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPChangeAnnotationStructure >> description [
	"A human-readable string which is rendered less prominent in
the user interface."

	^ data at: 'description'
]

{ #category : #accessing }
GtLSPChangeAnnotationStructure >> description: anObject [
	data at: 'description' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPChangeAnnotationStructure >> label [
	"A human-readable string describing the actual change. The string
is rendered prominent in the user interface."

	^ data at: 'label'
]

{ #category : #accessing }
GtLSPChangeAnnotationStructure >> label: anObject [
	data at: 'label' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPChangeAnnotationStructure >> needsConfirmation [
	"A flag which indicates that user confirmation is needed
before applying the change."

	^ data at: 'needsConfirmation'
]

{ #category : #accessing }
GtLSPChangeAnnotationStructure >> needsConfirmation: anObject [
	data at: 'needsConfirmation' put:  (self objectFor: anObject)
]
