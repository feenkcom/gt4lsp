Class {
	#name : #GtPythonExtractMethodRefactoring,
	#superclass : #GtLSPRefactoring,
	#instVars : [
		'lspFile',
		'interval',
		'ast',
		'nodesToExtract',
		'assigned',
		'globals',
		'arguments',
		'functionName',
		'functionLocation',
		'callLocation',
		'newSource'
	],
	#category : #'GToolkit4LSP-Refactoring-Python'
}

{ #category : #'instance creation' }
GtPythonExtractMethodRefactoring class >> extract: anInterval from: aLSPFile [
	| ref |
	ref := self on: aLSPFile lspDirectory.
	ref interval: anInterval.
	ref lspFile: aLSPFile.
	^ ref
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> arguments [
	^ arguments
		ifNil: [ | locals outerLocals |
			arguments := OrderedCollection new.
			self isInsideClass ifTrue: [ arguments add: self selfArgument ].
			(nodesToExtract first parentOfType: PyFunctionDefinitionNode)
				ifNotNil: [ :node | 
					locals := Set new.
					outerLocals := Set new.
					self
						variablesIn: node
						do: [ :each | 
							((nodesToExtract anySatisfy: [ :extr | each isDescendantFrom: extr ])
								ifTrue: [ locals ]
								ifFalse: [ outerLocals ]) add: each nameToken value ].
					self globals
						do: [ :each | 
							locals remove: each ifAbsent: [  ].
							outerLocals remove: each ifAbsent: [  ] ].
					((locals intersection: outerLocals)
						asSortedCollection: [ :a :b | 
							| aIndex bIndex |
							aIndex := (1 to: node parameters size)
									detect: [ :i | (self variablesIn: (node parameters at: i) name) includes: a ]
									ifNone: [ SmallInteger maxVal ].
							bIndex := (1 to: node parameters size)
									detect: [ :i | (self variablesIn: (node parameters at: i) name) includes: b ]
									ifNone: [ SmallInteger maxVal ].
							aIndex = bIndex ifTrue: [ a < b ] ifFalse: [ aIndex < bIndex ] ])
						do: [ :each | (arguments includes: each) ifFalse: [ arguments add: each ] ] ].
			arguments ]
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> arguments: anObject [
	arguments := anObject
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> assigned [
	assigned
		ifNil: [ assigned := Set new.
			nodesToExtract
				do: [ :each | self assignedVariablesIn: each do: [ :var | assigned add: var nameToken value ] ] ].
	^ assigned
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> assignedVariablesIn: aNode do: aBlock [
	| varBlock |
	varBlock := [ :node | 
		(node isKindOf: PyVariableExpressionNode) ifTrue: [ aBlock value: node ].
		(node isKindOf: PyTupleExpressionNode)
			ifTrue: [ node expressions do: varBlock ] ].
	aNode
		withAllNodesOfType: PyAssignmentStatementNode
		do: [ :each | varBlock value: each lhs ].
	aNode
		withAllNodesOfType: PyParameterNode
		do: [ :each | self variablesIn: each name do: aBlock ].
	aNode
		withAllNodesDo: [ :each | 
			((each isKindOf: PyForStatementNode)
				or: [ (each isKindOf: PyListForNode) or: [ each isKindOf: PyComprehensionForNode ] ])
				ifTrue: [ each exprs do: [ :expr | self variablesIn: expr do: aBlock ] ] ]
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> ast [
	^ ast ifNil: [ ast := PythonParser parseWithErrors: self lspFile source ]
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> callLocation [
	^ callLocation
]

{ #category : #preconditions }
GtPythonExtractMethodRefactoring >> checkAssignedLocals [
	(nodesToExtract first parentOfType: PyFunctionDefinitionNode)
		ifNotNil: [ :func | 
			self
				variablesIn: func
				do: [ :var | 
					(nodesToExtract anySatisfy: [ :ex | var isDescendantFrom: ex ])
						ifFalse: [ ((self assigned includes: var nameToken value)
								and: [ (self globals includes: var nameToken value) not ])
								ifTrue: [ ^ self
										refactoringError: var nameToken value
												, ' is assigned in the extracted code, but used outside the extracted interval' ] ] ] ]
]

{ #category : #preconditions }
GtPythonExtractMethodRefactoring >> checkNodeTypes [
	(nodesToExtract
		anySatisfy: [ :each | 
			(each isKindOf: PyClassDefinitionNode)
				or: [ each isKindOf: PyFunctionDefinitionNode ] ])
		ifTrue: [ ^ self invalidInterval ].
	nodesToExtract size = 1
		ifTrue: [ (nodesToExtract first nodeOfType: PyDecoratorExpressionNode) notNil
				ifTrue: [ ^ self invalidInterval ].
			(nodesToExtract first nodeOfType: PyAssignmentStatementNode)
				ifNotNil: [ :assign | nodesToExtract first == assign lhs ifTrue: [ ^ self invalidInterval ] ] ]
]

{ #category : #preconditions }
GtPythonExtractMethodRefactoring >> checkReturn [
	| containsReturn |
	containsReturn := false.
	nodesToExtract
		do: [ :each | 
			each
				withAllNodesOfType: PyReturnStatementNode
				do: [ :n | containsReturn := true ] ].
	containsReturn
		ifTrue: [ self lastIsReturn ifFalse: [ ^ self invalidInterval ] ]
]

{ #category : #transforming }
GtPythonExtractMethodRefactoring >> fixIndents: source [
	| newWS oldWS index end startOfLine char |
	newWS := self whitespaceBeforeFunction , '    '.
	index := nodesToExtract first startPosition.
	oldWS := nodesToExtract first completeSource
			startOfLineWhitespaceBeforeIndex: index.
	oldWS = newWS ifTrue: [ ^ self ].
	end := nodesToExtract last stopPosition.
	startOfLine := false.
	[ index ~= end ]
		whileTrue: [ char := source at: index.
			(startOfLine and: [ (String crlf includes: char) not ])
				ifTrue: [ index := self
							replaceIndentsIn: source
							from: oldWS
							to: newWS
							at: index ].
			startOfLine := String crlf includes: char.
			index := index + 1 ]
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> functionLocation [
	^ functionLocation
]

{ #category : #transforming }
GtPythonExtractMethodRefactoring >> functionName [
	^ functionName ifNil: [ '__' ]
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> functionName: aString [
	functionName := aString
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> globals [
	globals
		ifNil: [ globals := Set new.
			(nodesToExtract first parentOfType: PyFunctionDefinitionNode)
				ifNil: [ self
						assignedVariablesIn: self ast
						do: [ :var | 
							(var parentOfType: PyFunctionDefinitionNode)
								ifNil: [ globals add: var nameToken value ] ] ]
				ifNotNil: [ :func | 
					| notGlobals |
					func
						allNodesOfType: PyGlobalStatementNode
						do: [ :global | global nameTokens do: [ :each | globals add: each value ] ].
					notGlobals := Set new.
					func
						withAllNodesOfType: PyArgumentNode
						do: [ :arg | 
							arg name
								ifNotNil: [ :name | self variablesIn: name do: [ :var | notGlobals add: var nameToken value ] ] ].
					self
						assignedVariablesIn: func
						do: [ :var | 
							(globals includes: var nameToken value)
								ifFalse: [ notGlobals add: var nameToken value ] ].

					self
						variablesIn: func
						do: [ :var | 
							(notGlobals includes: var nameToken value)
								ifFalse: [ globals add: var nameToken value ] ] ] ].
	^ globals
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> interval [
	^ interval
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> interval: anObject [
	interval := anObject
]

{ #category : #preconditions }
GtPythonExtractMethodRefactoring >> invalidInterval [
	self refactoringError: 'Invalid interval to extract'
]

{ #category : #transforming }
GtPythonExtractMethodRefactoring >> isInsideClass [
	^ (nodesToExtract first parentOfType: PyClassDefinitionNode) notNil
		and: [ (nodesToExtract first parentOfType: PyFunctionDefinitionNode) parameters
				notEmpty ]
]

{ #category : #transforming }
GtPythonExtractMethodRefactoring >> isUsed: aNode [
	^ (aNode isKindOf: PyExpressionNode)
		and: [ (aNode parent isKindOf: PyExpressionStatementNode) not ]
]

{ #category : #preconditions }
GtPythonExtractMethodRefactoring >> lastIsReturn [
	^ nodesToExtract last isKindOf: PyReturnStatementNode
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> lspFile [
	^ lspFile
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> lspFile: anObject [
	lspFile := anObject
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> newSource [
	^ newSource
]

{ #category : #transforming }
GtPythonExtractMethodRefactoring >> positionForNewFunction [
	^ ((nodesToExtract first parentOfType: PyFunctionDefinitionNode)
		ifNil: [ nodesToExtract first lookupNode: [ :each | each parent parent isNil ] ])
		startPosition
]

{ #category : #preconditions }
GtPythonExtractMethodRefactoring >> preconditions [
	^ RBCondition
		withBlock: [ self verifyInterval.
			self checkNodeTypes.
			self checkReturn.
			self checkAssignedLocals.
			true ]
]

{ #category : #transforming }
GtPythonExtractMethodRefactoring >> replaceIndentsIn: source from: oldWS to: newWS at: index [
	| offset |
	offset := 0.
	oldWS isEmpty
		ifTrue: [ source insert: newWS at: index.
			^ index ].
	[ offset < oldWS size ]
		whileTrue: [ (source at: index + offset) ~= (oldWS at: offset + 1) ifTrue: [ ^ index ].
			offset := offset + 1 ].
	source
		replaceFrom: index
		to: index + oldWS size - 1
		with: newWS.
	^ index + oldWS size
]

{ #category : #transforming }
GtPythonExtractMethodRefactoring >> selfArgument [
	^ (nodesToExtract first parentOfType: PyFunctionDefinitionNode) parameters first
		source
]

{ #category : #transforming }
GtPythonExtractMethodRefactoring >> transform [
	| source isMoving position defLocation callLoc offset |
	source := SmaCCString on: nodesToExtract first completeSource.
	defLocation := (source
			insert: (String
					streamContents: [ :stream | 
						stream << 'def ' << self functionName << '('.
						self arguments
							do: [ :each | stream << each ]
							separatedBy: [ stream << ', ' ].
						stream << '):' << String lf << self whitespaceBeforeFunction << '    '.
						self variablesForGlobals notEmpty
							ifTrue: [ stream << 'global '.
								self variablesForGlobals
									do: [ :each | stream << each ]
									separatedBy: [ stream << ', ' ].
								stream << String lf << self whitespaceBeforeFunction << '    ' ] ])
			at: self positionForNewFunction) + 4.
	isMoving := nodesToExtract first startPosition ~= self positionForNewFunction.
	isMoving
		ifTrue: [ position := self positionForNewFunction.
			source
				moveFrom: nodesToExtract first startPosition
				to: nodesToExtract last stopPosition
				before: position ]
		ifFalse: [ position := nodesToExtract last stopPosition + 1 ].
	self fixIndents: source.
	nodesToExtract size = 1
		ifTrue: [ (self isUsed: nodesToExtract first)
				ifTrue: [ source insert: 'return ' at: nodesToExtract first startPosition ] ].
	source insert: String lf at: position.
	source insert: String lf at: position.
	source insert: self whitespaceBeforeFunction at: position.
	offset := 0.
	callLoc := (source
			insert: (String
					streamContents: [ :stream | 
						self lastIsReturn
							ifTrue: [ stream << 'return '.
								offset := 7 ].
						self isInsideClass
							ifTrue: [ stream << self selfArgument << '.'.
								offset := offset + self selfArgument size + 1 ].
						stream << self functionName << '('.
						(self isInsideClass
							ifTrue: [ self arguments allButFirst ]
							ifFalse: [ self arguments ])
							do: [ :each | stream << each ]
							separatedBy: [ stream << ', ' ].
						stream << ')' ])
			at: nodesToExtract last stopPosition + 1) + offset.
	functionLocation := source newPositionFor: defLocation.
	callLocation := source newPositionFor: callLoc.
	self changes
		addChange: (GtLSPFileChange new
				name: lspFile filename basename;
				lspFile: lspFile;
				newSource: source asString;
				yourself).
	newSource := source asString
]

{ #category : #accessing }
GtPythonExtractMethodRefactoring >> variablesForGlobals [
	^ (self globals select: [ :each | self assigned includes: each ])
		asSortedCollection
]

{ #category : #private }
GtPythonExtractMethodRefactoring >> variablesIn: aNode [
	| names |
	names := Set new.
	aNode
		ifNotNil: [ self variablesIn: aNode do: [ :each | names add: each nameToken value ] ].
	^ names
]

{ #category : #private }
GtPythonExtractMethodRefactoring >> variablesIn: aNode do: aBlock [
	aNode ifNil: [ ^ self ].
	aNode
		withAllNodesOfType: PyVariableExpressionNode
		do: [ :var | 
			((var parentOfType: PyArgumentNode)
				ifNil: [ true ]
				ifNotNil: [ :arg | (var isDescendantFrom: arg name) not ])
				ifTrue: [ aBlock value: var ] ]
]

{ #category : #preconditions }
GtPythonExtractMethodRefactoring >> verifyInterval [
	| node start end |
	interval isEmpty ifTrue: [ ^ self invalidInterval ].
	node := self ast nodeForInterval: self interval.
	(node respondsTo: #statements)
		ifTrue: [ start := (1 to: node statements size)
					detect: [ :i | (node statements at: i) stopPosition >= interval first ]
					ifNone: [  ].
			start = 1
				ifTrue: [ (node completeSource
						whitespaceStartIndexBeforeIndex: (node statements at: start) startPosition)
						<= interval first ifFalse: [ start := nil ] ].
			end := (node statements size to: 1 by: -1)
					detect: [ :i | (node statements at: i) startPosition <= interval last ]
					ifNone: [  ].
			nodesToExtract := (start isNil or: [ end isNil ])
					ifTrue: [ {node nodeOfType: PyStatementNode} ]
					ifFalse: [ node statements copyFrom: start to: end ] ]
		ifFalse: [ ((node parent isKindOf: PyArgumentNode)
				and: [ node parent name == node ]) ifTrue: [ node := node parent parent ].
			((node isKindOf: PyExpressionNode) or: [ node isKindOf: PyStatementNode ])
				ifTrue: [ nodesToExtract := ((node parent isKindOf: PyFunctionCallExpressionNode)
							and: [ node parent receiver == node ])
							ifTrue: [ {node parent} ]
							ifFalse: [ {node} ] ]
				ifFalse: [ (node
						nodeOfType: {PyStatementNode.
								PyExpressionNode})
						ifNil: [ ^ self invalidInterval ]
						ifNotNil: [ :n | nodesToExtract := {n} ] ] ]
]

{ #category : #transforming }
GtPythonExtractMethodRefactoring >> whitespaceBeforeFunction [
	^ (nodesToExtract first parentOfType: PyFunctionDefinitionNode)
		ifNil: [ '' ]
		ifNotNil: [ :node | node completeSource startOfLineWhitespaceBeforeIndex: node startPosition ]
]
