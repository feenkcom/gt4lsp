Class {
	#name : #GtLSPInlayHintLabelPartStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPInlayHintLabelPartStructure >> command [
	"An optional command for this label part.

Depending on the client capability `inlayHint.resolveSupport` clients
might resolve this property late using the resolve request."

	^ (data at: 'command' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCommandStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlayHintLabelPartStructure >> command: anObject [
	data at: 'command' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintLabelPartStructure >> location [
	"An optional source code location that represents this
label part.

The editor will use this location for the hover and for code navigation
features: This part will become a clickable link that resolves to the
definition of the symbol at the given location (not necessarily the
location itself), it shows the hover that shows at the given location,
and it shows a context menu with further code navigation commands.

Depending on the client capability `inlayHint.resolveSupport` clients
might resolve this property late using the resolve request."

	^ (data at: 'location' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPLocationStructure new data: obj ]
]

{ #category : #accessing }
GtLSPInlayHintLabelPartStructure >> location: anObject [
	data at: 'location' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintLabelPartStructure >> tooltip [
	"The tooltip text when you hover over this label part. Depending on
the client capability `inlayHint.resolveSupport` clients might resolve
this property late using the resolve request."

	^ data at: 'tooltip' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPInlayHintLabelPartStructure >> tooltip: anObject [
	data at: 'tooltip' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPInlayHintLabelPartStructure >> value [
	"The value of this label part."

	^ data at: 'value'
]

{ #category : #accessing }
GtLSPInlayHintLabelPartStructure >> value: anObject [
	data at: 'value' put:  (self objectFor: anObject)
]
