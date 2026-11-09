Class {
	#name : #GtLSPNoProgramSpecifiedError,
	#superclass : #Error,
	#category : #'GToolkit4LSP-Model'
}

{ #category : #testing }
GtLSPNoProgramSpecifiedError >> doesClassHaveDownloadOption: aClass [
	^ (aClass respondsTo: #downloadOptions)
		and: [ aClass downloadOptions notEmpty ]
]

{ #category : #private }
GtLSPNoProgramSpecifiedError >> findModelClass [
	^ (self signalerContext
		findContextSuchThat: [ :ctx | 
			(ctx receiver isKindOf: GtLSPDirectoryModel class)
				and: [ self doesClassHaveDownloadOption: ctx receiver ] ])
		ifNotNil: [ :ctx | ctx receiver ]
]

{ #category : #views }
GtLSPNoProgramSpecifiedError >> gtDebuggerDownloadViewFor: aView context: aContext [
	<gtExceptionView>
	self hasDownloadOption ifFalse: [ ^ aView empty ].
	^ aView explicit
		title: 'Installation';
		priority: 10;
		stencil: [ | options pane |
			options := self findModelClass downloadOptions.
			pane := BrVerticalPane new.
			pane matchParent.
			pane padding: (BlInsets all: 5).
			options
				do: [ :each | 
					pane
						addChild: (BrButton new
								aptitude: BrGlamorousButtonWithLabelAptitude;
								label: each first;
								action: [ each last value.
									aContext
										at: #currentDebugger
										ifPresent: [ :debug | debug resumeAndCloseDebugger ]
										ifAbsent: [  ] ];
								yourself) ].
			pane ]
]

{ #category : #accessing }
GtLSPNoProgramSpecifiedError >> gtExceptionDebuggerSpecification [
	^ super gtExceptionDebuggerSpecification
		title: 'Assertion Failure';
		enableWhen: [ self hasDownloadOption ]
]

{ #category : #testing }
GtLSPNoProgramSpecifiedError >> hasDownloadOption [
	self gtHasStack ifFalse: [ ^ false ].
	^ self findModelClass notNil
]

{ #category : #'private - testing' }
GtLSPNoProgramSpecifiedError >> isResumable [
	^ true
]
