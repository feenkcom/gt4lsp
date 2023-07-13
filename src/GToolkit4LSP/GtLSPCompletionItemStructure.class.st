Class {
	#name : #GtLSPCompletionItemStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCompletionItemStructure >> additionalTextEdits [
	"An optional array of additional {@link TextEdit text edits} that are applied when
selecting this completion. Edits must not overlap (including the same insert position)
with the main {@link CompletionItem.textEdit edit} nor with themselves.

Additional text edits should be used to change text unrelated to the current cursor position
(for example adding an import statement at the top of the file if the completion item will
insert an unqualified type)."

	^ data at: 'additionalTextEdits' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> additionalTextEdits: anObject [
	data at: 'additionalTextEdits' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> command [
	"An optional {@link Command command} that is executed *after* inserting this completion. *Note* that
additional modifications to the current document should be described with the
{@link CompletionItem.additionalTextEdits additionalTextEdits}-property."

	^ (data at: 'command' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCommandStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> command: anObject [
	data at: 'command' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> commitCharacters [
	"An optional set of characters that when pressed while this completion is active will accept it first and
then type that character. *Note* that all commit characters should have `length=1` and that superfluous
characters will be ignored."

	^ data at: 'commitCharacters' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> commitCharacters: anObject [
	data at: 'commitCharacters' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> data [
	"A data entry field that is preserved on a completion item between a
{@link CompletionRequest} and a {@link CompletionResolveRequest}."

	^ data at: 'data' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> deprecated [
	"Indicates if this item is deprecated.
@deprecated Use `tags` instead."

	^ data at: 'deprecated' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> deprecated: anObject [
	data at: 'deprecated' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> detail [
	"A human-readable string with additional information
about this item, like type or symbol information."

	^ data at: 'detail' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> detail: anObject [
	data at: 'detail' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> documentation [
	"A human-readable string that represents a doc-comment."

	^ data at: 'documentation' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> documentation: anObject [
	data at: 'documentation' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> filterText [
	"A string that should be used when filtering a set of
completion items. When `falsy` the {@link CompletionItem.label label}
is used."

	^ data at: 'filterText' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> filterText: anObject [
	data at: 'filterText' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> insertText [
	"A string that should be inserted into a document when selecting
this completion. When `falsy` the {@link CompletionItem.label label}
is used.

The `insertText` is subject to interpretation by the client side.
Some tools might not take the string literally. For example
VS Code when code complete is requested in this example
`con<cursor position>` and a completion item with an `insertText` of
`console` is provided it will only insert `sole`. Therefore it is
recommended to use `textEdit` instead since it avoids additional client
side interpretation."

	^ data at: 'insertText' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> insertText: anObject [
	data at: 'insertText' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> insertTextFormat [
	"The format of the insert text. The format applies to both the
`insertText` property and the `newText` property of a provided
`textEdit`. If omitted defaults to `InsertTextFormat.PlainText`.

Please note that the insertTextFormat doesn't apply to
`additionalTextEdits`."

	^ data at: 'insertTextFormat' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> insertTextFormat: anObject [
	data at: 'insertTextFormat' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> insertTextMode [
	"How whitespace and indentation is handled during completion
item insertion. If not provided the clients default value depends on
the `textDocument.completion.insertTextMode` client capability.

@since 3.16.0"

	^ data at: 'insertTextMode' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> insertTextMode: anObject [
	data at: 'insertTextMode' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> kind [
	"The kind of this completion item. Based of the kind
an icon is chosen by the editor."

	^ data at: 'kind' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> label [
	"The label of this completion item.

The label property is also by default the text that
is inserted when selecting this completion.

If label details are provided the label itself should
be an unqualified name of the completion item."

	^ data at: 'label'
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> label: anObject [
	data at: 'label' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> labelDetails [
	"Additional details for the label

@since 3.17.0"

	^ (data at: 'labelDetails' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCompletionItemLabelDetailsStructure new data: obj ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> labelDetails: anObject [
	data at: 'labelDetails' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> preselect [
	"Select this item when showing.

*Note* that only one completion item can be selected and that the
tool / client decides which item that is. The rule is that the *first*
item of those that match best is selected."

	^ data at: 'preselect' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> preselect: anObject [
	data at: 'preselect' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> sortText [
	"A string that should be used when comparing this item
with other items. When `falsy` the {@link CompletionItem.label label}
is used."

	^ data at: 'sortText' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> sortText: anObject [
	data at: 'sortText' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> tags [
	"Tags for this completion item.

@since 3.15.0"

	^ data at: 'tags' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> tags: anObject [
	data at: 'tags' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> textEdit [
	"An {@link TextEdit edit} which is applied to a document when selecting
this completion. When an edit is provided the value of
{@link CompletionItem.insertText insertText} is ignored.

Most editors support two different operations when accepting a completion
item. One is to insert a completion text and the other is to replace an
existing text with a completion text. Since this can usually not be
predetermined by a server it can report both ranges. Clients need to
signal support for `InsertReplaceEdits` via the
`textDocument.completion.insertReplaceSupport` client capability
property.

*Note 1:* The text edit's range as well as both ranges from an insert
replace edit must be a [single line] and they must contain the position
at which completion has been requested.
*Note 2:* If an `InsertReplaceEdit` is returned the edit's insert range
must be a prefix of the edit's replace range, that means it must be
contained and starting at the same position.

@since 3.16.0 additional type `InsertReplaceEdit`"

	^ data at: 'textEdit' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> textEdit: anObject [
	data at: 'textEdit' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> textEditText [
	"The edit text used if the completion item is part of a CompletionList and
CompletionList defines an item default for the text edit range.

Clients will only honor this property if they opt into completion list
item defaults using the capability `completionList.itemDefaults`.

If not provided and a list's default range is provided the label
property is used as a text.

@since 3.17.0"

	^ data at: 'textEditText' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionItemStructure >> textEditText: anObject [
	data at: 'textEditText' put:  (self objectFor: anObject)
]
