accessing
selectMatching: aString
	| json result |
	json := ('https://maps.googleapis.com/maps/api/place/autocomplete/json?input=', aString, '&key=', GooglePlace apiKey) asUrl retrieveContents.
	result := NeoJSONReader fromString: json.
	(result at: 'status') = 'OK' ifFalse: [ self error ].
	^ (result at: 'predictions') collect: [ :d | GooglePlacePrediction newFrom: d ]