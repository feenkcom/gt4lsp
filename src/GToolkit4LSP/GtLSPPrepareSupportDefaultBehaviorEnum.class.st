Class {
	#name : #GtLSPPrepareSupportDefaultBehaviorEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPPrepareSupportDefaultBehaviorEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Identifier' 'Identifier' 'The client''s default behavior is to select the identifier
according the to language''s syntax rule.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
