Class {
	#name : #GtLSPNotebookCellKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPNotebookCellKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Markup' 'Markup' 'A markup-cell is formatted source that is used for display.')
		#('Code' 'Code' 'A code-cell is source code.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
