as yet unclassified
fromUrl: aUrl
	| json result |
	json := aUrl retrieveContents.
	result := NeoJSONReader fromString: json.
	(result at: 'status') = 'OK' ifFalse: [ self error ].
	^ result values last asGooglePlacesObject: self