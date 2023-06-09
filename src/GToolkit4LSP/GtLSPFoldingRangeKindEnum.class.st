Class {
	#name : #GtLSPFoldingRangeKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPFoldingRangeKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Comment' 'Comment' 'Folding range for a comment')
		#('Imports' 'Imports' 'Folding range for an import or include')
		#('Region' 'Region' 'Folding range for a region (e.g. `#region`)')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
