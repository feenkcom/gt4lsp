Class {
	#name : #GtLSPCoderAction,
	#superclass : #Object,
	#instVars : [
		'title',
		'action',
		'icon',
		'id',
		'order'
	],
	#category : #'GToolkit4LSP-View'
}

{ #category : #comparing }
GtLSPCoderAction >> = anObject [
	^ self class = anObject class
		and: [ self id = anObject id and: [ self title = anObject title ] ]
]

{ #category : #accessing }
GtLSPCoderAction >> action [
	^ action ifNil: [ [  ] ]
]

{ #category : #accessing }
GtLSPCoderAction >> action: anObject [
	action := anObject
]

{ #category : #accessing }
GtLSPCoderAction >> buildToolbarElementIn: toolbar [
	| button |
	button := BrButton new
			aptitude: BrGlamorousButtonWithIconAptitude;
			beSmallSize;
			icon: self icon;
			label: self title;
			action: self action.
	self id
		ifNil: [ toolbar addChild: button ]
		ifNotNil: [ toolbar addChild: button as: self id ]
]

{ #category : #comparing }
GtLSPCoderAction >> hash [
	^ self class hash bitXor: self title hash
]

{ #category : #accessing }
GtLSPCoderAction >> icon [
	^ icon
]

{ #category : #accessing }
GtLSPCoderAction >> icon: anObject [
	icon := anObject
]

{ #category : #accessing }
GtLSPCoderAction >> id [
	^ id
]

{ #category : #accessing }
GtLSPCoderAction >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GtLSPCoderAction >> order [
	^ order ifNil: [ 100 ]
]

{ #category : #accessing }
GtLSPCoderAction >> order: anInteger [
	order := anInteger
]

{ #category : #accessing }
GtLSPCoderAction >> title [
	^ title
]

{ #category : #accessing }
GtLSPCoderAction >> title: aString [
	title := aString
]
