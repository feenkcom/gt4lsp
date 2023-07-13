Class {
	#name : #GtLSPDidChangeWatchedFilesClientCapabilitiesStructure,
	#superclass : #GtLSPStructure,
	#category : #'GToolkit4LSP-Structures'
}

{ #category : #accessing }
GtLSPDidChangeWatchedFilesClientCapabilitiesStructure >> dynamicRegistration [
	"Did change watched files notification supports dynamic registration. Please note
that the current protocol doesn't support static configuration for file changes
from the server side."

	^ data at: 'dynamicRegistration' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDidChangeWatchedFilesClientCapabilitiesStructure >> dynamicRegistration: anObject [
	data at: 'dynamicRegistration' put:  (self objectFor: anObject)
]

{ #category : #accessing }
GtLSPDidChangeWatchedFilesClientCapabilitiesStructure >> relativePatternSupport [
	"Whether the client has support for {@link  RelativePattern relative pattern}
or not.

@since 3.17.0"

	^ data at: 'relativePatternSupport' ifAbsent: [ ]
]

{ #category : #accessing }
GtLSPDidChangeWatchedFilesClientCapabilitiesStructure >> relativePatternSupport: anObject [
	data at: 'relativePatternSupport' put:  (self objectFor: anObject)
]
