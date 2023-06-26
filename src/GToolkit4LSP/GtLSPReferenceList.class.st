Class {
	#name : #GtLSPReferenceList,
	#superclass : #Object,
	#instVars : [
		'references'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPReferenceList >> gtReferenceList: aView [
	<gtView>
	^ aView list
		title: 'References';
		items: [ references ]
]

{ #category : #accessing }
GtLSPReferenceList >> references [
	^ references
]

{ #category : #accessing }
GtLSPReferenceList >> references: anObject [
	references := anObject
]
