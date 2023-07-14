Class {
	#name : #GtLSPFileOperationPatternStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFileOperationPatternStructure >> glob [
	"The glob pattern to match. Glob patterns can have the following syntax:
- `*` to match one or more characters in a path segment
- `?` to match on one character in a path segment
- `**` to match any number of path segments, including none
- `{}` to group sub patterns into an OR expression. (e.g. `**​/*.{ts,js}` matches all TypeScript and JavaScript files)
- `[]` to declare a range of characters to match in a path segment (e.g., `example.[0-9]` to match on `example.0`, `example.1`, …)
- `[!...]` to negate a range of characters to match in a path segment (e.g., `example.[!0-9]` to match on `example.a`, `example.b`, but not `example.0`)"

	^ data at: 'glob'
]

{ #category : #accessing }
GtLSPFileOperationPatternStructure >> glob: anObject [
	data at: 'glob' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationPatternStructure >> matches [
	"Whether to match files or folders with this pattern.

Matches both if undefined."

	^ data at: 'matches' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPFileOperationPatternStructure >> matches: anObject [
	data at: 'matches' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPFileOperationPatternStructure >> options [
	"Additional options used during matching."

	^ (data at: 'options' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPFileOperationPatternOptionsStructure on: obj ]
]

{ #category : #accessing }
GtLSPFileOperationPatternStructure >> options: anObject [
	data at: 'options' put:  (self objectFor: anObject)
]
