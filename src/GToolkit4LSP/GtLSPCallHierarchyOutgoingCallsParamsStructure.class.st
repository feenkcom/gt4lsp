Class {
	#name : #GtLSPCallHierarchyOutgoingCallsParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPCallHierarchyOutgoingCallsParamsStructure >> create [
	data at: 'item' put: GtLSPCallHierarchyItemStructure create  asDictionary
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallsParamsStructure >> item [
	^ (data at: 'item') ifNotNil: [ :obj | GtLSPCallHierarchyItemStructure on: obj ]
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallsParamsStructure >> item: anObject [
	data at: 'item' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallsParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallsParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallsParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallsParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
