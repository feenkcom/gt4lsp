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
				spec repository: 'github://svenvc/NeoJSON:2415f508808bc0d29ed74e3e816f59bfc8aac895/repository' ].
		spec
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.8.1135/src' ].
		spec
			baseline: 'GToolkitAnnouncerUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.8.239/src' ].
		spec
			baseline: 'JSONParser' with: [
				spec repository: 'github://j-brant/SmaCC:v3.0.24' ].
		spec
			baseline: 'RustParser' with: [
				spec repository: 'github://j-brant/SmaCC:v3.0.24' ].

		spec package: 'GToolkit4LSP' with: [
			spec requires: #('NeoJSON') ].
	]
]
