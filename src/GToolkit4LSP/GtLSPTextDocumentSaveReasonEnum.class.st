Class {
	#name : #GtLSPTextDocumentSaveReasonEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPTextDocumentSaveReasonEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Manual' 1 'Manually triggered, e.g. by the user pressing save, by starting debugging,
or by an API call.')
		#('AfterDelay' 2 'Automatic after a delay.')
		#('FocusOut' 3 'When the editor lost focus.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
