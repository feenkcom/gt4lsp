Class {
	#name : #GtLSPColorStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPColorStructure >> alpha [
	"The alpha component of this color in the range [0-1]."

	^ data at: 'alpha'
]

{ #category : #accessing }
GtLSPColorStructure >> alpha: anObject [
	data at: 'alpha' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPColorStructure >> blue [
	"The blue component of this color in the range [0-1]."

	^ data at: 'blue'
]

{ #category : #accessing }
GtLSPColorStructure >> blue: anObject [
	data at: 'blue' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPColorStructure >> green [
	"The green component of this color in the range [0-1]."

	^ data at: 'green'
]

{ #category : #accessing }
GtLSPColorStructure >> green: anObject [
	data at: 'green' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPColorStructure >> red [
	"The red component of this color in the range [0-1]."

	^ data at: 'red'
]

{ #category : #accessing }
GtLSPColorStructure >> red: anObject [
	data at: 'red' put:  (self objectFor: anObject)
]
