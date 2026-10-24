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
				spec repository: 'github://svenvc/NeoJSON:11e274dd96dc9636cab90929937b7cd09719de7c/repository' ].
		spec
			baseline: 'GToolkitPhlow' with: [
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.9.204/src' ].
		spec
			baseline: 'GToolkitAnnouncerUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.9.59/src' ].
		spec
			baseline: 'JSONParser' with: [
				spec repository: 'github://j-brant/SmaCC:25ab055db78eee98a1a1267ca2f137052c5b5f96/src' ].
		spec
			baseline: 'RustParser' with: [
				spec repository: 'github://j-brant/SmaCC:25ab055db78eee98a1a1267ca2f137052c5b5f96/src' ].

		spec package: 'GToolkit4LSP' with: [
			spec requires: #(#NeoJSON) ].
	]
]
