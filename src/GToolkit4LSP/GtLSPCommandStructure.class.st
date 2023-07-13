Class {
	#name : #GtLSPCommandStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCommandStructure >> arguments [
	"Arguments that the command handler should be
invoked with."

	^ data at: 'arguments' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCommandStructure >> arguments: anObject [
	data at: 'arguments' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCommandStructure >> command [
	"The identifier of the actual command handler."

	^ data at: 'command'
]

{ #category : #accessing }
GtLSPCommandStructure >> command: anObject [
	data at: 'command' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCommandStructure >> title [
	"Title of the command, like `save`."

	^ data at: 'title'
]

{ #category : #accessing }
GtLSPCommandStructure >> title: anObject [
	data at: 'title' put:  (self objectFor: anObject)
]
