Class {
	#name : #GtLSPPositionEncodingKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPPositionEncodingKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('UTF8' 'utf-8' 'Character offsets count UTF-8 code units (e.g. bytes).')
		#('UTF16' 'utf-16' 'Character offsets count UTF-16 code units.

This is the default and must always be supported
by servers')
		#('UTF32' 'utf-32' 'Character offsets count UTF-32 code units.

Implementation note: these are the same as Unicode codepoints,
so this `PositionEncodingKind` may also be used for an
encoding-agnostic representation of character offsets.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
