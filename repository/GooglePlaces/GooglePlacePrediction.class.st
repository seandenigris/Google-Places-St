Class {
	#name : #GooglePlacePrediction,
	#superclass : #GooglePlacesObject,
	#classVars : [
		'ApiKey'
	],
	#category : 'GooglePlaces'
}

{ #category : #accessing }
GooglePlacePrediction class >> selectMatching: aString [
	| url |
	url := 'https://maps.googleapis.com/maps/api/place/autocomplete/json' asUrl.
	url
		queryAt: #input put: aString;
		queryAt: #key put: GooglePlace apiKey.
	^ GooglePlacePrediction fromUrl: url.
]

{ #category : #converting }
GooglePlacePrediction >> asText [
	^ (self at: 'description') asText
]

{ #category : #converting }
GooglePlacePrediction >> details [
	| urlString |
	urlString := 'https://maps.googleapis.com/maps/api/place/details/json?placeid=', self place_id, '&key=', GooglePlace apiKey.
	^ GooglePlaceDetails fromUrl: urlString asUrl.
]

{ #category : #converting }
GooglePlacePrediction >> place [

	^ GooglePlace new
			id: self place_id;
			nickname: self description;
			yourself
]

{ #category : #printing }
GooglePlacePrediction >> printOn: aStream [
	aStream nextPutAll: (self at: 'description')
]
