Class {
	#name : #GtLSPEnum,
	#superclass : #Object,
	#instVars : [
		'name',
		'value',
		'description'
	],
	#classInstVars : [
		'instances'
	],
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'code generation' }
GtLSPEnum class >> compileEnum: aDictionary [
	| enumName values class |
	enumName := aDictionary at: 'name'.
	values := aDictionary at: 'values'.
	class := self
			subclass: ('GtLSP' , enumName , 'Enum') asSymbol
			instanceVariableNames: ''
			classVariableNames: ''
			category: self category.
	class class
		compile: (String
				streamContents: [ :stream | 
					stream
						<< 'initialize';
						cr;
						<< '	instances := Dictionary new.
	#(';
						cr.
					values
						do: [ :each | 
							(stream << '		#(' << (each at: 'name') printString << ' '
								<< (each at: 'name') printString << ' '
								<< (each at: 'documentation' ifAbsent: [  ]) printString)
								<< ')';
								cr ].
					stream
						<< '	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]' ])
		classified: #'class initialization'.
	class initialize
]

{ #category : #'code generation' }
GtLSPEnum class >> compileNewClasses [
	| values |
	values := NeoJSONReader
			fromString: (ZnClient new
					get: 'https://raw.githubusercontent.com/microsoft/vscode-languageserver-node/main/protocol/metaModel.json').
	(values at: 'enumerations') do: [ :each | self compileEnum: each ]
]

{ #category : #accessing }
GtLSPEnum class >> enum: aString [
	^ instances at: aString
]

{ #category : #accessing }
GtLSPEnum class >> enumFor: aValue [
	^ instances detect: [ :each | each value = aValue ] ifNone: [  ]
]

{ #category : #accessing }
GtLSPEnum class >> enums [
	^ instances values
]

{ #category : #'code generation' }
GtLSPEnum class >> generateClasses [
	self removeSubclasses.
	self compileNewClasses
]

{ #category : #'code generation' }
GtLSPEnum class >> removeSubclasses [
	self subclasses do: [ :each | each removeFromSystem ]
]

{ #category : #'code generation' }
GtLSPEnum class >> valueOf: aString in: aJSONObjectNode [
	| values |
	values := (aJSONObjectNode / JSONMemberNode) @ #name <- aString.
	values isEmpty ifTrue: [ ^ 'nil' ].
	^ (values anyOne value source copyReplaceAll: '''' with: '''''')
		copyReplaceAll: '"'
		with: ''''
]

{ #category : #accessing }
GtLSPEnum >> description [
	^ description
]

{ #category : #accessing }
GtLSPEnum >> description: anObject [
	description := anObject
]

{ #category : #accessing }
GtLSPEnum >> name [
	^ name
]

{ #category : #accessing }
GtLSPEnum >> name: anObject [
	name := anObject
]

{ #category : #printing }
GtLSPEnum >> printOn: aStream [
	aStream << name << ': ' << value asString
]

{ #category : #accessing }
GtLSPEnum >> value [
	^ value
]

{ #category : #accessing }
GtLSPEnum >> value: anObject [
	value := anObject
]
