Class {
	#name : #GtLSPFileChangeTypeEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPFileChangeTypeEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Created' 'Created' 'The file got created.')
		#('Changed' 'Changed' 'The file got changed.')
		#('Deleted' 'Deleted' 'The file got deleted.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
