Class {
	#name : #GtLSPDocumentSymbol,
	#superclass : #GtLSPFileLocation,
	#instVars : [
		'symbolInformation'
	],
	#category : #'GToolkit4LSP-Model'
}

{ #category : #accessing }
GtLSPDocumentSymbol >> kind [
	^ symbolInformation ifNotNil: [ symbolInformation kind ]
]

{ #category : #accessing }
GtLSPDocumentSymbol >> symbolInformation [
	^ symbolInformation
]

{ #category : #accessing }
GtLSPDocumentSymbol >> symbolInformation: anObject [
	symbolInformation := anObject.
	symbolInformation
		ifNotNil: [ self startPosition: symbolInformation location range start.
			self endPosition: symbolInformation location range end ]
]

{ #category : #accessing }
GtLSPDocumentSymbol >> symbolName [
	^ symbolInformation ifNotNil: [ symbolInformation name ]
]
