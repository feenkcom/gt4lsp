Class {
	#name : #GtLSPWorkDoneProgressBeginStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> cancellable [
	"Controls if a cancel button should show to allow the user to cancel the
long running operation. Clients that don't support cancellation are allowed
to ignore the setting."

	^ data at: 'cancellable' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> cancellable: anObject [
	data at: 'cancellable' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> kind [
	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> message [
	"Optional, more detailed associated progress message. Contains
complementary information to the `title`.

Examples: ""3/25 files"", ""project/src/module2"", ""node_modules/some_dep"".
If unset, the previous progress message (if any) is still valid."

	^ data at: 'message' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> message: anObject [
	data at: 'message' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> percentage [
	"Optional progress percentage to display (value 100 is considered 100%).
If not provided infinite progress is assumed and clients are allowed
to ignore the `percentage` value in subsequent in report notifications.

The value should be steadily rising. Clients are free to ignore values
that are not following this rule. The value range is [0, 100]."

	^ data at: 'percentage' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> percentage: anObject [
	data at: 'percentage' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> title [
	"Mandatory title of the progress operation. Used to briefly inform about
the kind of operation being performed.

Examples: ""Indexing"" or ""Linking dependencies""."

	^ data at: 'title'
]

{ #category : #accessing }
GtLSPWorkDoneProgressBeginStructure >> title: anObject [
	data at: 'title' put:  (self objectFor: anObject)
]
