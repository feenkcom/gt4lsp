Class {
	#name : #GtLSPFileOperationPatternKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPFileOperationPatternKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('file' 'file' 'The pattern matches a file only.')
		#('folder' 'folder' 'The pattern matches a folder only.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
