Class {
	#name : #GtLSPInlineCompletionItemStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlineCompletionItemStructure >> command [
	"An optional {@link Command} that is executed *after* inserting this completion."

	^ (data at: 'command' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCommandStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineCompletionItemStructure >> command: anObject [
	data at: 'command' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineCompletionItemStructure >> filterText [
	"A text that is used to decide if this inline completion should be shown. When `falsy` the {@link InlineCompletionItem.insertText} is used."

	^ data at: 'filterText' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPInlineCompletionItemStructure >> filterText: anObject [
	data at: 'filterText' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineCompletionItemStructure >> insertText [
	"The text to replace the range with. Must be set."

	^ data at: 'insertText'
]

{ #category : #accessing }
GtLSPInlineCompletionItemStructure >> insertText: anObject [
	data at: 'insertText' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlineCompletionItemStructure >> range [
	"The range to replace. Must begin and end on the same line."

	^ (data at: 'range' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlineCompletionItemStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]
