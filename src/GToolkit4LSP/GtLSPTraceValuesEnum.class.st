Class {
	#name : #GtLSPTraceValuesEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPTraceValuesEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('Off' 'Off' 'Turn tracing off.')
		#('Messages' 'Messages' 'Trace messages only.')
		#('Verbose' 'Verbose' 'Verbose message tracing.')
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
