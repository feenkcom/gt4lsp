Class {
	#name : #GtLSPWorkspaceFoldersServerCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPWorkspaceFoldersServerCapabilitiesStructure >> changeNotifications [
	"Whether the server wants to receive workspace folder
change notifications.

If a string is provided the string is treated as an ID
under which the notification is registered on the client
side. The ID can be used to unregister for these events
using the `client/unregisterCapability` request."

	^ data at: 'changeNotifications'
]

{ #category : #accessing }
GtLSPWorkspaceFoldersServerCapabilitiesStructure >> changeNotifications: anObject [
	data at: 'changeNotifications' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPWorkspaceFoldersServerCapabilitiesStructure >> supported [
	"The server has support for workspace folders"

	^ data at: 'supported'
]

{ #category : #accessing }
GtLSPWorkspaceFoldersServerCapabilitiesStructure >> supported: anObject [
	data at: 'supported' put:  (self objectFor: anObject)
]
