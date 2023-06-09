Class {
	#name : #GtLSPInsertTextFormatEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPInsertTextFormatEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('PlainText' 'PlainText' 'The primary text to be inserted is treated as a plain string.')
		#('Snippet' 'Snippet' 'The primary text to be inserted is treated as a snippet.

A snippet can define tab stops and placeholders with `$1`, `$2`
and `${3:foo}`. `$0` defines the final tab stop, it defaults to
the end of the snippet. Placeholders with equal identifiers are linked,
that is typing in one will update others too.

See also: https://microsoft.github.io/language-server-protocol/specifications/specification-current/#snippet_syntax')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
