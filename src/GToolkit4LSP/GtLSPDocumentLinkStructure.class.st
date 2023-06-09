Class {
	#name : #GtLSPDocumentLinkStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPDocumentLinkStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDocumentLinkStructure >> data [
	"A data entry field that is preserved on a document link between a
DocumentLinkRequest and a DocumentLinkResolveRequest."

	^ data at: 'data'
]

{ #category : #accessing }
GtLSPDocumentLinkStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentLinkStructure >> range [
	"The range this link applies to."

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDocumentLinkStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentLinkStructure >> target [
	"The uri this link points to. If missing a resolve request is sent later."

	^ data at: 'target'
]

{ #category : #accessing }
GtLSPDocumentLinkStructure >> target: anObject [
	data at: 'target' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDocumentLinkStructure >> tooltip [
	"The tooltip text when you hover over this link.

If a tooltip is provided, is will be displayed in a string that includes instructions on how to
trigger the link, such as `{0} (ctrl + click)`. The specific instructions vary depending on OS,
user settings, and localization.

@since 3.15.0"

	^ data at: 'tooltip'
]

{ #category : #accessing }
GtLSPDocumentLinkStructure >> tooltip: anObject [
	data at: 'tooltip' put:  (self objectFor: anObject)
]
