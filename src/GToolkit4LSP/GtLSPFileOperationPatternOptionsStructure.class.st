Class {
	#name : #GtLSPFileOperationPatternOptionsStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPFileOperationPatternOptionsStructure >> ignoreCase [
	"The pattern should be matched ignoring casing."

	^ data at: 'ignoreCase'
]

{ #category : #accessing }
GtLSPFileOperationPatternOptionsStructure >> ignoreCase: anObject [
	data at: 'ignoreCase' put:  (self objectFor: anObject)
]
