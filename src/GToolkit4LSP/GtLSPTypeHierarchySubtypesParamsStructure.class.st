Class {
	#name : #GtLSPTypeHierarchySubtypesParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPTypeHierarchySubtypesParamsStructure >> create [
	data at: 'item' put: GtLSPTypeHierarchyItemStructure create  asDictionary
]

{ #category : #accessing }
GtLSPTypeHierarchySubtypesParamsStructure >> item [
	^ (data at: 'item') ifNotNil: [ :obj | GtLSPTypeHierarchyItemStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTypeHierarchySubtypesParamsStructure >> item: anObject [
	data at: 'item' put:  (self objectFor: anObject)
]
