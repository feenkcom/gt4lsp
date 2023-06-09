Class {
	#name : #GtLSPCompletionItemLabelDetailsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCompletionItemLabelDetailsStructure >> description [
	"An optional string which is rendered less prominently after {@link CompletionItem.detail}. Should be used
for fully qualified names and file paths."

	^ data at: 'description'
]

{ #category : #accessing }
GtLSPCompletionItemLabelDetailsStructure >> description: anObject [
	data at: 'description' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemLabelDetailsStructure >> detail [
	"An optional string which is rendered less prominently directly after {@link CompletionItem.label label},
without any spacing. Should be used for function signatures and type annotations."

	^ data at: 'detail'
]

{ #category : #accessing }
GtLSPCompletionItemLabelDetailsStructure >> detail: anObject [
	data at: 'detail' put:  (self objectFor: anObject)
]
