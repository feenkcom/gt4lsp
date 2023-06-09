Class {
	#name : #GtLSPApplyWorkspaceEditParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPApplyWorkspaceEditParamsStructure >> create [
	data at: 'edit' put: GtLSPWorkspaceEditStructure create  asDictionary
]

{ #category : #accessing }
GtLSPApplyWorkspaceEditParamsStructure >> edit [
	"The edits to apply."

	^ (data at: 'edit') ifNotNil: [ :obj | GtLSPWorkspaceEditStructure new data: obj ]
]

{ #category : #accessing }
GtLSPApplyWorkspaceEditParamsStructure >> edit: anObject [
	data at: 'edit' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPApplyWorkspaceEditParamsStructure >> label [
	"An optional label of the workspace edit. This label is
presented in the user interface for example on an undo
stack to undo the workspace edit."

	^ data at: 'label'
]

{ #category : #accessing }
GtLSPApplyWorkspaceEditParamsStructure >> label: anObject [
	data at: 'label' put:  (self objectFor: anObject)
]
