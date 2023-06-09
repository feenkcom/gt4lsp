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
