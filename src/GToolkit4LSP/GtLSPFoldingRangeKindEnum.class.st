Class {
	#name : #GtLSPFoldingRangeKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPFoldingRangeKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Comment' 'comment' 'Folding range for a comment')
		#('Imports' 'imports' 'Folding range for an import or include')
		#('Region' 'region' 'Folding range for a region (e.g. `#region`)')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
