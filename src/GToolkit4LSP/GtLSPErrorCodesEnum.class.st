Class {
	#name : #GtLSPErrorCodesEnum,
	#superclass : #GtLSPEnum,
	#category : #'GToolkit4LSP-Enums'
}

{ #category : #'class initialization' }
GtLSPErrorCodesEnum class >> initialize [
	instances := Dictionary new.
	#(
		#('ParseError' -32700 nil)
		#('InvalidRequest' -32600 nil)
		#('MethodNotFound' -32601 nil)
		#('InvalidParams' -32602 nil)
		#('InternalError' -32603 nil)
		#('ServerNotInitialized' -32002 'Error code indicating that a server received a notification or
request before the server has received the `initialize` request.')
		#('UnknownErrorCode' -32001 nil)
	) 
		do: [:each | 
			instances at: each first put: (self new name: each first; value: each second; description: each third)]
]
