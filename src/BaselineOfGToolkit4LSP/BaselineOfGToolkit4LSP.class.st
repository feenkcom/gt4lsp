Class {
	#name : #BaselineOfGToolkit4LSP,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkit4LSP
}

{ #category : #accessing }
BaselineOfGToolkit4LSP >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'NeoJSON'
					with: [ spec repository: 'github://svenvc/NeoJSON:master/repository' ];
				baseline: 'GToolkitPhlow'
					with: [ spec repository: 'github://feenkcom/gtoolkit-phlow:main/src' ];
				baseline: 'GToolkitAnnouncerUtility'
					with: [ spec repository: 'github://feenkcom/gtoolkit-utility:main/src' ];
				baseline: 'JSONParser' with: [ spec repository: 'github://j-brant/SmaCC' ];
				baseline: 'RustParser' with: [ spec repository: 'github://j-brant/SmaCC' ].
			spec package: 'GToolkit4LSP' with: [ spec requires: #('NeoJSON') ] ]
]
