Class {
	#name : #GtLSPCallHierarchyIncomingCallStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPCallHierarchyIncomingCallStructure >> create [
	data at: 'from' put: GtLSPCallHierarchyItemStructure create  asDictionary.
	data at: 'fromRanges' put: #()
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallStructure >> from [
	"The item that makes the call."

	^ (data at: 'from') ifNotNil: [ :obj | GtLSPCallHierarchyItemStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallStructure >> from: anObject [
	data at: 'from' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallStructure >> fromRanges [
	"The ranges at which the calls appear. This is relative to the caller
denoted by {@link CallHierarchyIncomingCall.from `this.from`}."

	^ data at: 'fromRanges'
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallStructure >> fromRanges: anObject [
	data at: 'fromRanges' put:  (self objectFor: anObject)
]
