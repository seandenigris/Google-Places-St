accessing
details
	| urlString result |
	details ifNotNil: [ ^ details ].
	urlString := 'https://maps.googleapis.com/maps/api/place/details/json?placeid=', self id, '&key=', GooglePlace apiKey.
	result := NeoJSONReader fromString: urlString asUrl retrieveContents.
	(result at: 'status') = 'OK' ifFalse: [ self error ].
	^ GooglePlaceDetails newFrom: (result at: 'result')