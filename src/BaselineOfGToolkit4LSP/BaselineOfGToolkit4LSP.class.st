Class {
	#name : #BaselineOfGToolkit4LSP,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkit4LSP
}

{ #category : #baseline }
BaselineOfGToolkit4LSP >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'NeoJSON' with: [
				spec repository: 'github://svenvc/NeoJSON:f5652fb238989c9b4287179ff0725eab25765033/repository' ].
		spec
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.1377/src' ].
		spec
			baseline: 'GToolkitAnnouncerUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.8.324/src' ].
		spec
			baseline: 'JSONParser' with: [
				spec repository: 'github://j-brant/SmaCC:v3.0.69' ].
		spec
			baseline: 'RustParser' with: [
				spec repository: 'github://j-brant/SmaCC:v3.0.69' ].

		spec package: 'GToolkit4LSP' with: [
			spec requires: #('NeoJSON') ].
	]
]
