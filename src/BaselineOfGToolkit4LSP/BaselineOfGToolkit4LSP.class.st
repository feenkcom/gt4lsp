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
				spec repository: 'github://feenkcom/gtoolkit-phlow:v0.9.228/src' ].
		spec
			baseline: 'GToolkitAnnouncerUtility' with: [
				spec repository: 'github://feenkcom/gtoolkit-utility:v0.9.72/src' ].
		spec
			baseline: 'JSONParser' with: [
				spec repository: 'github://j-brant/SmaCC:657cacbc14398d322a2d1fed08f09eb507091c89/src' ].
		spec
			baseline: 'RustParser' with: [
				spec repository: 'github://j-brant/SmaCC:657cacbc14398d322a2d1fed08f09eb507091c89/src' ].

		spec package: 'GToolkit4LSP' with: [
			spec requires: #(#NeoJSON) ].
	]
]
