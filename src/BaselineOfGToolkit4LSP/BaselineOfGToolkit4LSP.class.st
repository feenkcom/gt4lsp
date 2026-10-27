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
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.9.205/src' ].
		spec
			baseline: 'GToolkitAnnouncerUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.9.59/src' ].
		spec
			baseline: 'JSONParser' with: [
				spec repository: 'github://j-brant/SmaCC:002450820e55dac98fb3164e856ecc69a2edd101/src' ].
		spec
			baseline: 'RustParser' with: [
				spec repository: 'github://j-brant/SmaCC:002450820e55dac98fb3164e856ecc69a2edd101/src' ].

		spec package: 'GToolkit4LSP' with: [
			spec requires: #(#NeoJSON) ].
	]
]
