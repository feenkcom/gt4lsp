Class {
	#name : #GtLSPShowDocumentParamsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPShowDocumentParamsStructure >> external [
	"Indicates to show the resource in an external program.
To show, for example, `https://code.visualstudio.com/`
in the default WEB browser set `external` to `true`."

	^ data at: 'external'
]

{ #category : #accessing }
GtLSPShowDocumentParamsStructure >> external: anObject [
	data at: 'external' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPShowDocumentParamsStructure >> selection [
	"An optional selection range if the document is a text
document. Clients might ignore the property if an
external program is started or the file is not a text
file."

	^ (data at: 'selection') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPShowDocumentParamsStructure >> selection: anObject [
	data at: 'selection' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPShowDocumentParamsStructure >> takeFocus [
	"An optional property to indicate whether the editor
showing the document should take focus or not.
Clients might ignore this property if an external
program is started."

	^ data at: 'takeFocus'
]

{ #category : #accessing }
GtLSPShowDocumentParamsStructure >> takeFocus: anObject [
	data at: 'takeFocus' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPShowDocumentParamsStructure >> uri [
	"The uri to show."

	^ data at: 'uri'
]

{ #category : #accessing }
GtLSPShowDocumentParamsStructure >> uri: anObject [
	data at: 'uri' put:  (self objectFor: anObject)
]
