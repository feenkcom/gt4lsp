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
	^ (data at: 'item') ifNotNil: [ :obj | GtLSPCallHierarchyItemStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCallHierarchyOutgoingCallsParamsStructure >> item: anObject [
	data at: 'item' put:  (self objectFor: anObject)
]
