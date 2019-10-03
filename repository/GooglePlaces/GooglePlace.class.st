Class {
	#name : #GooglePlace,
	#superclass : #GooglePlacesObject,
	#instVars : [
		'id',
		'details',
		'nickname'
	],
	#classVars : [
		'ApiKey',
		'Cache'
	],
	#category : #GooglePlaces
}

{ #category : #accessing }
GooglePlace class >> apiKey [
	^ ApiKey ifNil: [ UIManager default request: 'Google Places API Key?' ]
]

{ #category : #accessing }
GooglePlace class >> apiKey: anObject [
	ApiKey := anObject
]

{ #category : #accessing }
GooglePlace class >> cache [
	^ Cache ifNil: [ Cache := Dictionary new ]
]

{ #category : #accessing }
GooglePlace class >> cache: anObject [
	Cache := anObject
]

{ #category : #accessing }
GooglePlace class >> find: aString [
	"Reference: https://developers.google.com/places/web-service/search#FindPlaceRequests"
	| url |
	self cache at: aString ifPresent: [ :res | ^ res ].
	url := 'https://maps.googleapis.com/maps/api/place/findplacefromtext/json' asUrl.
	url
		queryAt: #input put: aString;
		queryAt: #inputtype put: #textquery;
		queryAt: #key put: GooglePlace apiKey.
	^ self fromUrl: url.
]

{ #category : #accessing }
GooglePlace class >> searchFor: aString [
	"Reference: https://developers.google.com/places/web-service/search#TextSearchRequests"
	| url |
	self cache at: aString ifPresent: [ :res | ^ res ].
	url := 'https://maps.googleapis.com/maps/api/place/textsearch/json' asUrl.
	url
		queryAt: #query put: aString;
		queryAt: #key put: GooglePlace apiKey.
	^ self fromUrl: url.
]

{ #category : #accessing }
GooglePlace >> details [
	| urlString result |
	details ifNotNil: [ ^ details ].
	urlString := 'https://maps.googleapis.com/maps/api/place/details/json?placeid=', self id, '&key=', GooglePlace apiKey.
	result := NeoJSONReader fromString: urlString asUrl retrieveContents.
	(result at: 'status') = 'OK' ifFalse: [ self error ].
	^ GooglePlaceDetails newFrom: (result at: 'result')
]

{ #category : #accessing }
GooglePlace >> id [
	^ id
]

{ #category : #accessing }
GooglePlace >> id: anObject [
	id := anObject
]

{ #category : #accessing }
GooglePlace >> nickname [
	^ nickname
]

{ #category : #accessing }
GooglePlace >> nickname: anObject [
	nickname := anObject
]

{ #category : #printing }
GooglePlace >> printOn: aStream [
	nickname ifNotNil: [ :nn | aStream nextPutAll: nn ]
]
