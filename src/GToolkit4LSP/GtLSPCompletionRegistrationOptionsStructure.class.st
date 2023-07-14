Class {
	#name : #GtLSPCompletionRegistrationOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> allCommitCharacters [
	"The list of all possible characters that commit a completion. This field can be used
if clients don't support individual commit characters per completion item. See
`ClientCapabilities.textDocument.completion.completionItem.commitCharactersSupport`

If a server provides both `allCommitCharacters` and commit characters on an individual
completion item the ones on the completion item win.

@since 3.2.0"

	^ data at: 'allCommitCharacters' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> allCommitCharacters: anObject [
	data at: 'allCommitCharacters' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> completionItem [
	"The server supports the following `CompletionItem` specific
capabilities.

@since 3.17.0"

	^ data at: 'completionItem' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> completionItem: anObject [
	data at: 'completionItem' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> documentSelector [
	"A document selector to identify the scope of the registration. If set to null
the document selector provided on the client side will be used."

	^ data at: 'documentSelector'
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> documentSelector: anObject [
	data at: 'documentSelector' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> resolveProvider [
	"The server provides support to resolve additional
information for a completion item."

	^ data at: 'resolveProvider' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> resolveProvider: anObject [
	data at: 'resolveProvider' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> triggerCharacters [
	"Most tools trigger completion request automatically without explicitly requesting
it using a keyboard shortcut (e.g. Ctrl+Space). Typically they do so when the user
starts to type an identifier. For example if the user types `c` in a JavaScript file
code complete will automatically pop up present `console` besides others as a
completion item. Characters that make up identifiers don't need to be listed here.

If code complete should automatically be trigger on characters not being valid inside
an identifier (for example `.` in JavaScript) list them in `triggerCharacters`."

	^ data at: 'triggerCharacters' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> triggerCharacters: anObject [
	data at: 'triggerCharacters' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> workDoneProgress [
	^ data at: 'workDoneProgress' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPCompletionRegistrationOptionsStructure >> workDoneProgress: anObject [
	data at: 'workDoneProgress' put:  (self objectFor: anObject)
]
