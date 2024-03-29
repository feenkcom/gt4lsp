Class {
	#name : #GtLSPInsertTextModeEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPInsertTextModeEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('asIs' 1 'The insertion or replace strings is taken as it is. If the
value is multi line the lines below the cursor will be
inserted using the indentation defined in the string value.
The client will not apply any kind of adjustments to the
string.')
		#('adjustIndentation' 2 'The editor adjusts leading whitespace of new lines so that
they match the indentation up to the cursor of the line for
which the item is accepted.

Consider a line like this: <2tabs><cursor><3tabs>foo. Accepting a
multi line completion item is indented using 2 tabs and all
following lines inserted will be indented using 2 tabs as well.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
