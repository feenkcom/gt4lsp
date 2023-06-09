Class {
	#name : #GtLSPErrorCodesEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPErrorCodesEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('ParseError' 'ParseError' nil)
		#('InvalidRequest' 'InvalidRequest' nil)
		#('MethodNotFound' 'MethodNotFound' nil)
		#('InvalidParams' 'InvalidParams' nil)
		#('InternalError' 'InternalError' nil)
		#('ServerNotInitialized' 'ServerNotInitialized' 'Error code indicating that a server received a notification or
request before the server has received the `initialize` request.')
		#('UnknownErrorCode' 'UnknownErrorCode' nil)
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
