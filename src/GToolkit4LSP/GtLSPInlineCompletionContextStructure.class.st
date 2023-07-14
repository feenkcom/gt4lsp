Class {
	#name : #GtLSPInlineCompletionContextStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlineCompletionContextStructure >> selectedCompletionInfo [
	"Provides information about the currently selected item in the autocomplete widget if it is visible."

	^ (data at: 'selectedCompletionInfo' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPSelectedCompletionInfoStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineCompletionContextStructure >> selectedCompletionInfo: anObject [
	data at: 'selectedCompletionInfo' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineCompletionContextStructure >> triggerKind [
	"Describes how the inline completion was triggered."

	^ data at: 'triggerKind'
]

{ #category : #accessing }
GtLSPInlineCompletionContextStructure >> triggerKind: anObject [
	data at: 'triggerKind' put:  (self objectFor: anObject)
]
