Class {
	#name : #GtLSPNotebookCellArrayChangeStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPNotebookCellArrayChangeStructure >> cells [
	"The new cells, if any"

	^ data at: 'cells' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPNotebookCellArrayChangeStructure >> cells: anObject [
	data at: 'cells' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookCellArrayChangeStructure >> deleteCount [
	"The deleted cells"

	^ data at: 'deleteCount'
]

{ #category : #accessing }
GtLSPNotebookCellArrayChangeStructure >> deleteCount: anObject [
	data at: 'deleteCount' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPNotebookCellArrayChangeStructure >> start [
	"The start oftest of the cell that changed."

	^ data at: 'start'
]

{ #category : #accessing }
GtLSPNotebookCellArrayChangeStructure >> start: anObject [
	data at: 'start' put:  (self objectFor: anObject)
]
