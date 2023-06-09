Class {
	#name : #GtLSPCompletionClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> completionItem [
	"The client supports the following `CompletionItem` specific
capabilities."

	^ data at: 'completionItem'
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> completionItem: anObject [
	data at: 'completionItem' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> completionItemKind [
	^ data at: 'completionItemKind'
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> completionItemKind: anObject [
	data at: 'completionItemKind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> completionList [
	"The client supports the following `CompletionList` specific
capabilities.

@since 3.17.0"

	^ data at: 'completionList'
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> completionList: anObject [
	data at: 'completionList' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> contextSupport [
	"The client supports to send additional context information for a
`textDocument/completion` request."

	^ data at: 'contextSupport'
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> contextSupport: anObject [
	data at: 'contextSupport' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> dynamicRegistration [
	"Whether completion supports dynamic registration."

	^ data at: 'dynamicRegistration'
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> insertTextMode [
	"Defines how the client handles whitespace and indentation
when accepting a completion item that uses multi line
text in either `insertText` or `textEdit`.

@since 3.17.0"

	^ data at: 'insertTextMode'
]

{ #category : #accessing }
GtLSPCompletionClientCapabilitiesStructure >> insertTextMode: anObject [
	data at: 'insertTextMode' put:  (self objectFor: anObject)
]
