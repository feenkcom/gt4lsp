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

{ #category : #accessing }
GtLSPTypeHierarchySupertypesParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken'
]

{ #category : #accessing }
GtLSPTypeHierarchySupertypesParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeHierarchySupertypesParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken'
]

{ #category : #accessing }
GtLSPTypeHierarchySupertypesParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
