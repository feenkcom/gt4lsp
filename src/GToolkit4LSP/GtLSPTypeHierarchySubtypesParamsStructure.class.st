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

{ #category : #accessing }
GtLSPTypeHierarchySubtypesParamsStructure >> partialResultToken [
	"An optional token that a server can use to report partial results (e.g. streaming) to
the client."

	^ data at: 'partialResultToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTypeHierarchySubtypesParamsStructure >> partialResultToken: anObject [
	data at: 'partialResultToken' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPTypeHierarchySubtypesParamsStructure >> workDoneToken [
	"An optional token that a server can use to report work done progress."

	^ data at: 'workDoneToken' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPTypeHierarchySubtypesParamsStructure >> workDoneToken: anObject [
	data at: 'workDoneToken' put:  (self objectFor: anObject)
]
