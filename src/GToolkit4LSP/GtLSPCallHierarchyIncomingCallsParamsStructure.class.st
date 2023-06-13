Class {
	#name : #GtLSPCallHierarchyIncomingCallsParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPCallHierarchyIncomingCallsParamsStructure >> create [
	data at: 'item' put: GtLSPCallHierarchyItemStructure create  asDictionary
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallsParamsStructure >> item [
	^ (data at: 'item') ifNotNil: [ :obj | GtLSPCallHierarchyItemStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallsParamsStructure >> item: anObject [
	data at: 'item' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallsParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken'
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallsParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallsParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken'
]

{ #category : #accessing }
GtLSPCallHierarchyIncomingCallsParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
