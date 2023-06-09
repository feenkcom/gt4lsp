Class {
	#name : #GtLSPInitializeErrorStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInitializeErrorStructure >> retry [
	"Indicates whether the client execute the following retry logic:
(1) show the message provided by the ResponseError to the user
(2) user selects retry or cancel
(3) if user selected retry the initialize method is sent again."

	^ data at: 'retry'
]

{ #category : #accessing }
GtLSPInitializeErrorStructure >> retry: anObject [
	data at: 'retry' put:  (self objectFor: anObject)
]
