Class {
	#name : #GtLSPFileChangeTypeEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPFileChangeTypeEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Created' 1 'The file got created.')
		#('Changed' 2 'The file got changed.')
		#('Deleted' 3 'The file got deleted.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
