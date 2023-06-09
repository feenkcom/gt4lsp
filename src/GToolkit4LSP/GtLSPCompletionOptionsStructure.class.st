Class {
	#name : #GtLSPCompletionOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCompletionOptionsStructure >> allCommitCharacters [
	"The list of all possible characters that commit a completion. This field can be used
if clients don't support individual commit characters per completion item. See
`ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`

If a server provides both `allCommitCharacters` and commit characters on an individual
completion item the ones on the completion item win.

@since 3.2.0"

	^ data at: 'allCommitCharacters'
]

{ #category : #accessing }
GtLSPCompletionOptionsStructure >> allCommitCharacters: anObject [
	data at: 'allCommitCharacters' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionOptionsStructure >> completionItem [
	"The server supports the following `CompletionItem` specific
capabilities.

@since 3.17.0"

	^ data at: 'completionItem'
]

{ #category : #accessing }
GtLSPCompletionOptionsStructure >> completionItem: anObject [
	data at: 'completionItem' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionOptionsStructure >> resolveProvider [
	"The server provides support to resolve additional
information for a completion item."

	^ data at: 'resolveProvider'
]

{ #category : #accessing }
GtLSPCompletionOptionsStructure >> resolveProvider: anObject [
	data at: 'resolveProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionOptionsStructure >> triggerCharacters [
	"Most tools trigger completion request automatically without explicitly requesting
it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do so when the user
starts to type an identifier. For example if the user types `c` in a JavaScript file
code complete will automatically pop up present `console` besides others as a
completion item. Characters that make up identifiers don't need to be listed here.

If code complete should automatically be trigger on characters not being valid inside
an identifier (for example `.` in JavaScript) list them in `triggerCharacters`."

	^ data at: 'triggerCharacters'
]

{ #category : #accessing }
GtLSPCompletionOptionsStructure >> triggerCharacters: anObject [
	data at: 'triggerCharacters' put:  (self objectFor: anObject)
]
