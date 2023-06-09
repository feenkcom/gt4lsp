Class {
	#name : #GtLSPApplyWorkspaceEditResultStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPApplyWorkspaceEditResultStructure >> applied [
	"Indicates whether the edit was applied or not."

	^ data at: 'applied'
]

{ #category : #accessing }
GtLSPApplyWorkspaceEditResultStructure >> applied: anObject [
	data at: 'applied' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPApplyWorkspaceEditResultStructure >> failedChange [
	"Depending on the client's failure handling strategy `failedChange` might
contain the index of the change that failed. This property is only available
if the client signals a `failureHandlingStrategy` in its client capabilities."

	^ data at: 'failedChange'
]

{ #category : #accessing }
GtLSPApplyWorkspaceEditResultStructure >> failedChange: anObject [
	data at: 'failedChange' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPApplyWorkspaceEditResultStructure >> failureReason [
	"An optional textual description for why the edit was not applied.
This may be used by the server for diagnostic logging or to provide
a suitable error for a request that triggered the edit."

	^ data at: 'failureReason'
]

{ #category : #accessing }
GtLSPApplyWorkspaceEditResultStructure >> failureReason: anObject [
	data at: 'failureReason' put:  (self objectFor: anObject)
]
