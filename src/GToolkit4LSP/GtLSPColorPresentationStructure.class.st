Class {
	#name : #GtLSPColorPresentationStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPColorPresentationStructure >> additionalTextEdits [
	"An optional array of additional {@link TextEdit text edits} that are applied when
selecting this color presentation. Edits must not overlap with the main {@link ColorPresentation.textEdit edit} nor with themselves."

	^ data at: 'additionalTextEdits' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPColorPresentationStructure >> additionalTextEdits: anObject [
	data at: 'additionalTextEdits' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPColorPresentationStructure >> label [
	"The label of this color presentation. It will be shown on the color
picker header. By default this is also the text that is inserted when selecting
this color presentation."

	^ data at: 'label'
]

{ #category : #accessing }
GtLSPColorPresentationStructure >> label: anObject [
	data at: 'label' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPColorPresentationStructure >> textEdit [
	"An {@link TextEdit edit} which is applied to a document when selecting
this presentation for the color.  When `falsy` the {@link ColorPresentation.label label}
is used."

	^ (data at: 'textEdit' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPTextEditStructure on: obj ]
]

{ #category : #accessing }
GtLSPColorPresentationStructure >> textEdit: anObject [
	data at: 'textEdit' put:  (self objectFor: anObject)
]
