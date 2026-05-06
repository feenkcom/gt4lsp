Class {
	#name : #GtPythonExtractMethodRefactoringExamples,
	#superclass : #Object,
	#category : #'GToolkit4LSP-Refactoring-Python'
}

{ #category : #'as yet unclassified' }
GtPythonExtractMethodRefactoringExamples >> extractStatement [
	<gtExample>
	| refactoring change |
	refactoring := GtPythonExtractMethodRefactoring
			extract: (45 to: 64)
			from: self testPy.
	refactoring functionName: 'statement2'.
	refactoring primitiveExecute.
	change := refactoring model changes gtAllChanges
			detect: [ :each | each class = GtLSPFileChange ].
	self
		assert: change newSource
		equals: 'def statement2():
    print("Statement 2")

def print_lines():
  print("Statement 1")
  statement2()
  print("Statement 3")'.
	^ change
]

{ #category : #'as yet unclassified' }
GtPythonExtractMethodRefactoringExamples >> failInvalidExtractionInterval [
	<gtExample>
	| refactoring |
	refactoring := GtPythonExtractMethodRefactoring
			extract: (1 to: 0)
			from: self testPy.
	[ refactoring primitiveExecute ]
		on: RBRefactoringError
		do: [ :ex | ^ ex copy freeze ].
	self error: 'Refactoring did not throw an error'
]

{ #category : #samples }
GtPythonExtractMethodRefactoringExamples >> model [
	^ GtLSPPythonModel local
]

{ #category : #samples }
GtPythonExtractMethodRefactoringExamples >> testPy [
	^ (self model createFile: 'test.py') source: 'def print_lines():
  print("Statement 1")
  print("Statement 2")
  print("Statement 3")'
]
