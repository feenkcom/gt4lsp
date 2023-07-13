Class {
	#name : #GtLSPMonikerStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPMonikerStructure >> identifier [
	"The identifier of the moniker. The value is opaque in LSIF however
schema owners are allowed to define the structure if they want."

	^ data at: 'identifier'
]

{ #category : #accessing }
GtLSPMonikerStructure >> identifier: anObject [
	data at: 'identifier' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPMonikerStructure >> kind [
	"The moniker kind if known."

	^ data at: 'kind' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPMonikerStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPMonikerStructure >> scheme [
	"The scheme of the moniker. For example tsc or .Net"

	^ data at: 'scheme'
]

{ #category : #accessing }
GtLSPMonikerStructure >> scheme: anObject [
	data at: 'scheme' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPMonikerStructure >> unique [
	"The scope in which the moniker is unique"

	^ data at: 'unique'
]

{ #category : #accessing }
GtLSPMonikerStructure >> unique: anObject [
	data at: 'unique' put:  (self objectFor: anObject)
]
