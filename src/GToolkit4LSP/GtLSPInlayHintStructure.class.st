Class {
	#name : #GtLSPInlayHintStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #initialization }
GtLSPInlayHintStructure >> create [
	data at: 'position' put: GtLSPPositionStructure create  asDictionary
]

{ #category : #accessing }
GtLSPInlayHintStructure >> data [
	"A data entry field that is preserved on an inlay hint between
a `textDocument/inlayHint` and a `inlayHint/resolve` request."

	^ data at: 'data'
]

{ #category : #accessing }
GtLSPInlayHintStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintStructure >> kind [
	"The kind of this hint. Can be omitted in which case the client
should fall back to a reasonable default."

	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPInlayHintStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintStructure >> label [
	"The label of this hint. A human readable string or an array of
InlayHintLabelPart label parts.

*Note* that neither the string nor the label part can be empty."

	^ data at: 'label'
]

{ #category : #accessing }
GtLSPInlayHintStructure >> label: anObject [
	data at: 'label' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintStructure >> paddingLeft [
	"Render padding before the hint.

Note: Padding should use the editor's background color, not the
background color of the hint itself. That means padding can be used
to visually align/separate an inlay hint."

	^ data at: 'paddingLeft'
]

{ #category : #accessing }
GtLSPInlayHintStructure >> paddingLeft: anObject [
	data at: 'paddingLeft' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintStructure >> paddingRight [
	"Render padding after the hint.

Note: Padding should use the editor's background color, not the
background color of the hint itself. That means padding can be used
to visually align/separate an inlay hint."

	^ data at: 'paddingRight'
]

{ #category : #accessing }
GtLSPInlayHintStructure >> paddingRight: anObject [
	data at: 'paddingRight' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintStructure >> position [
	"The position of this hint."

	^ (data at: 'position') ifNotNil: [ :obj | GtLSPPositionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlayHintStructure >> position: anObject [
	data at: 'position' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintStructure >> textEdits [
	"Optional text edits that are performed when accepting this inlay hint.

*Note* that edits are expected to change the document so that the inlay
hint (or its nearest variant) is now part of the document and the inlay
hint itself is now obsolete."

	^ data at: 'textEdits'
]

{ #category : #accessing }
GtLSPInlayHintStructure >> textEdits: anObject [
	data at: 'textEdits' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintStructure >> tooltip [
	"The tooltip text when you hover over this item."

	^ data at: 'tooltip'
]

{ #category : #accessing }
GtLSPInlayHintStructure >> tooltip: anObject [
	data at: 'tooltip' put:  (self objectFor: anObject)
]
