Class {
	#name : #GtLSPMarkdownClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPMarkdownClientCapabilitiesStructure >> allowedTags [
	"A list of HTML tags that the client allows / supports in
Markdown.

@since 3.17.0"

	^ data at: 'allowedTags'
]

{ #category : #accessing }
GtLSPMarkdownClientCapabilitiesStructure >> allowedTags: anObject [
	data at: 'allowedTags' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPMarkdownClientCapabilitiesStructure >> parser [
	"The name of the parser."

	^ data at: 'parser'
]

{ #category : #accessing }
GtLSPMarkdownClientCapabilitiesStructure >> parser: anObject [
	data at: 'parser' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPMarkdownClientCapabilitiesStructure >> version [
	"The version of the parser."

	^ data at: 'version'
]

{ #category : #accessing }
GtLSPMarkdownClientCapabilitiesStructure >> version: anObject [
	data at: 'version' put:  (self objectFor: anObject)
]
