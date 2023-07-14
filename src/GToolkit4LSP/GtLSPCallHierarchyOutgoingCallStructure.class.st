Class {
	#name : #GtLSPCallHierarchyOutgoingCallStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPCallHierarchyOutgoingCallStructure >> create [
	data at: 'to' put: GtLSPCallHierarchyItemStructure create  asDictionary.
	data at: 'fromRanges' put: #()
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallStructure >> fromRanges [
	"The range at which this item is called. This is the range relative to the caller, e.g the item
passed to {@link CallHierarchyItemProvider.provideCallHierarchyOutgoingCalls `provideCallHierarchyOutgoingCalls`}
and not {@link CallHierarchyOutgoingCall.to `this.to`}."

	^ data at: 'fromRanges'
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallStructure >> fromRanges: anObject [
	data at: 'fromRanges' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallStructure >> to [
	"The item that is called."

	^ (data at: 'to') ifNotNil: [ :obj | GtLSPCallHierarchyItemStructure on: obj ]
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallStructure >> to: anObject [
	data at: 'to' put:  (self objectFor: anObject)
]
