Class {
	#name : #GooglePlace,
	#superclass : #Object,
	#instVars : [
		'id',
		'details',
		'nickname'
	],
	#classVars : [
		'ApiKey'
	],
	#category : 'GooglePlaces'
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
