Class {
	#name : #GooglePlacesObject,
	#superclass : #Dictionary,
	#category : 'GooglePlaces'
}

{ #category : #'as yet unclassified' }
GooglePlacesObject class >> fromUrl: aUrl [
	| result |
	result := self jsonFromUrl: aUrl.
	(result at: 'status') = 'OK' ifFalse: [ self error: 'Google Places returned ', (result at: #status). 'For more info, see https://developers.google.com/places/web-service/search#PlaceSearchStatusCodes.' ].
	^ (result at: #results) asGooglePlacesObject: self
]

{ #category : #'as yet unclassified' }
GooglePlacesObject class >> jsonFromUrl: aUrl [
	^ NeoJSONReader fromString: aUrl retrieveContents.
]

{ #category : #converting }
GooglePlacesObject >> doesNotUnderstand: aMessage [
	^ self
			at: aMessage selector
			ifAbsent: [ super doesNotUnderstand: aMessage ]
]
