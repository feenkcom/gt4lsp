Class {
	#name : #GtLSPCompletionListStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPCompletionListStructure >> create [
	data at: 'items' put: #()
]

{ #category : #accessing }
GtLSPCompletionListStructure >> isIncomplete [
	"This list it not complete. Further typing results in recomputing this list.

Recomputed lists have all their items replaced (not appended) in the
incomplete completion sessions."

	^ data at: 'isIncomplete'
]

{ #category : #accessing }
GtLSPCompletionListStructure >> isIncomplete: anObject [
	data at: 'isIncomplete' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionListStructure >> itemDefaults [
	"In many cases the items of an actual completion result share the same
value for properties like `commitCharacters` or the range of a text
edit. A completion list can therefore define item defaults which will
be used if a completion item itself doesn't specify the value.

If a completion list specifies a default value and a completion item
also specifies a corresponding value the one from the item is used.

Servers are only allowed to return default values if the client
signals support for this via the `completionList.itemDefaults`
capability.

@since 3.17.0"

	^ data at: 'itemDefaults' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionListStructure >> itemDefaults: anObject [
	data at: 'itemDefaults' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionListStructure >> items [
	"The completion items."

	^ data at: 'items'
]

{ #category : #accessing }
GtLSPCompletionListStructure >> items: anObject [
	data at: 'items' put:  (self objectFor: anObject)
]
