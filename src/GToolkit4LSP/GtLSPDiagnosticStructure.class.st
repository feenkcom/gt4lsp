Class {
	#name : #GtLSPDiagnosticStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDiagnosticStructure >> code [
	"The diagnostic's code, which usually appear in the user interface."

	^ data at: 'code' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> code: anObject [
	data at: 'code' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> codeDescription [
	"An optional property to describe the error code.
Requires the code field (above) to be present/not null.

@since 3.16.0"

	^ (data at: 'codeDescription' ifAbsent: [ ]) ifNotNil: [ :obj | GtLSPCodeDescriptionStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> codeDescription: anObject [
	data at: 'codeDescription' put:  (self objectFor: anObject)
]

{ #category : #initialization }
GtLSPDiagnosticStructure >> create [
	data at: 'range' put: GtLSPRangeStructure create  asDictionary
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> data [
	"A data entry field that is preserved between a `textDocument/publishDiagnostics`
notification and `textDocument/codeAction` request.

@since 3.16.0"

	^ data at: 'data' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> data: anObject [
	data at: 'data' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> message [
	"The diagnostic's message. It usually appears in the user interface"

	^ data at: 'message'
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> message: anObject [
	data at: 'message' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> range [
	"The range at which the message applies"

	^ (data at: 'range') ifNotNil: [ :obj | GtLSPRangeStructure new data: obj ]
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> range: anObject [
	data at: 'range' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> relatedInformation [
	"An array of related diagnostic information, e.g. when symbol-names within
a scope collide all definitions can be marked via this property."

	^ data at: 'relatedInformation' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> relatedInformation: anObject [
	data at: 'relatedInformation' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> severity [
	"The diagnostic's severity. Can be omitted. If omitted it is up to the
client to interpret diagnostics as error, warning, info or hint."

	^ data at: 'severity' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> severity: anObject [
	data at: 'severity' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> source [
	"A human-readable string describing the source of this
diagnostic, e.g. 'typescript' or 'super lint'. It usually
appears in the user interface."

	^ data at: 'source' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> source: anObject [
	data at: 'source' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> tags [
	"Additional metadata about the diagnostic.

@since 3.15.0"

	^ data at: 'tags' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDiagnosticStructure >> tags: anObject [
	data at: 'tags' put:  (self objectFor: anObject)
]
