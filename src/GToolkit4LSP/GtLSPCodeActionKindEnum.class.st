Class {
	#name : #GtLSPCodeActionKindEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPCodeActionKindEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Empty' 'Empty' 'Empty kind.')
		#('QuickFix' 'QuickFix' 'Base kind for quickfix actions: ''quickfix''')
		#('Refactor' 'Refactor' 'Base kind for refactoring actions: ''refactor''')
		#('RefactorExtract' 'RefactorExtract' 'Base kind for refactoring extraction actions: ''refactor.extract''

Example extract actions:

- Extract method
- Extract function
- Extract variable
- Extract interface from class
- ...')
		#('RefactorInline' 'RefactorInline' 'Base kind for refactoring inline actions: ''refactor.inline''

Example inline actions:

- Inline function
- Inline variable
- Inline constant
- ...')
		#('RefactorRewrite' 'RefactorRewrite' 'Base kind for refactoring rewrite actions: ''refactor.rewrite''

Example rewrite actions:

- Convert JavaScript function to class
- Add or remove parameter
- Encapsulate field
- Make method static
- Move method to base class
- ...')
		#('Source' 'Source' 'Base kind for source actions: `source`

Source code actions apply to the entire file.')
		#('SourceOrganizeImports' 'SourceOrganizeImports' 'Base kind for an organize imports source action: `source.organizeImports`')
		#('SourceFixAll' 'SourceFixAll' 'Base kind for auto-fix source actions: `source.fixAll`.

Fix all actions automatically fix errors that have a clear fix that do not require user input.
They should not suppress errors or perform unsafe fixes such as generating new types or classes.

@since 3.15.0')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
