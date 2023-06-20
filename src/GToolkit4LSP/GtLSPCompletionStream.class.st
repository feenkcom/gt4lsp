Class {
	#name : #GtLSPCompletionStream,
	#superclass : #Object,
	#traits : 'TAsyncStream',
	#classTraits : 'TAsyncStream classTrait',
	#instVars : [
		'lock',
		'waker',
		'streamHolder'
	],
	#category : #'GToolkit4LSP-Completion'
}

{ #category : #accessing }
GtLSPCompletionStream >> completionResults: aCollection [
	lock
		critical: [ streamHolder at: 1 put: aCollection asAsyncStream.
			waker wakeUp ]
]

{ #category : #accessing }
GtLSPCompletionStream >> initialize [
	super initialize.
	lock := Mutex new.
	waker := AsyncFutureExecutionAtomicWaker new.
	streamHolder := Array new: 1
]

{ #category : #'api - stream' }
GtLSPCompletionStream >> pollNext: anAsynchronousContext [
	| stream |
	lock
		critical: [ stream := streamHolder first.
			stream ifNil: [ waker register: anAsynchronousContext waker ] ].
	^ stream
		ifNil: [ AsyncPoll pending ]
		ifNotNil: [ stream pollNext: anAsynchronousContext ]
]

{ #category : #'api - stream copy' }
GtLSPCompletionStream >> postSimilarCopy [
	waker := AsyncFutureExecutionAtomicWaker new.
	lock
		critical: [ streamHolder := streamHolder copy.
			streamHolder first
				ifNotNil: [ streamHolder at: 1 put: streamHolder first asyncSimilarCopy ] ]
]
