accessing
selectMatching: aString
	| urlString |
	urlString := 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=', aString, '&key=', GooglePlace apiKey.
	^ GooglePlacePrediction fromUrl: urlString asUrl.