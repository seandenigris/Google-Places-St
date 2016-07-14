converting
details
	| urlString |
	urlString := 'https://maps.googleapis.com/maps/api/place/details/json?placeid=', self place_id, '&key=', GooglePlace apiKey.
	^ NeoJSONReader fromString: urlString asUrl retrieveContents