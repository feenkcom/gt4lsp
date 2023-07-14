Class {
	#name : #GtLSPWorkDoneProgressReportStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkDoneProgressReportStructure >> cancellable [
	"Controls enablement state of a cancel button.

Clients that don't support cancellation or don't support controlling the button's
enablement state are allowed to ignore the property."

	^ data at: 'cancellable' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkDoneProgressReportStructure >> cancellable: anObject [
	data at: 'cancellable' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkDoneProgressReportStructure >> kind [
	^ data at: 'kind'
]

{ #category : #accessing }
GtLSPWorkDoneProgressReportStructure >> kind: anObject [
	data at: 'kind' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkDoneProgressReportStructure >> message [
	"Optional, more detailed associated progress message. Contains
complementary information to the `title`.

Examples: ""3/25 files"", ""project/src/module2"", ""node_modules/some_dep"".
If unset, the previous progress message (if any) is still valid."

	^ data at: 'message' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkDoneProgressReportStructure >> message: anObject [
	data at: 'message' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkDoneProgressReportStructure >> percentage [
	"Optional progress percentage to display (value 100 is considered 100%).
If not provided infinite progress is assumed and clients are allowed
to ignore the `percentage` value in subsequent in report notifications.

The value should be steadily rising. Clients are free to ignore values
that are not following this rule. The value range is [0, 100]"

	^ data at: 'percentage' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPWorkDoneProgressReportStructure >> percentage: anObject [
	data at: 'percentage' put:  (self objectFor: anObject)
]
