Class {
	#name : #GtLSPTypeHierarchySupertypesParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPTypeHierarchySupertypesParamsStructure >> create [
	data at: 'item' put: GtLSPTypeHierarchyItemStructure create  asDictionary
]

{ #category : #accessing }
GtLSPTypeHierarchySupertypesParamsStructure >> item [
	^ (data at: 'item') ifNotNil: [ :obj | GtLSPTypeHierarchyItemStructure new data: obj ]
]

{ #category : #accessing }
GtLSPTypeHierarchySupertypesParamsStructure >> item: anObject [
	data at: 'item' put:  (self objectFor: anObject)
]
