Class {
	#name : #GtLSPServerIOSignal,
	#superclass : #StringSignal,
	#category : #'GToolkit4LSP-Client'
}

{ #category : #accessing }
GtLSPServerIOSignal >> gtJSONView: aView context: aContext [
	<gtView>
	^ aView forward
		title: 'JSON';
		priority: 0;
		object: [ GtJson forJsonString: message ];
		view: #gtJsonObjectFor:context:
]
