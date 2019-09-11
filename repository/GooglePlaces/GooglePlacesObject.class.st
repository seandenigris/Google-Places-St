Class {
	#name : #GooglePlacesObject,
	#superclass : #Dictionary,
	#category : 'GooglePlaces'
}

{ #category : #'as yet unclassified' }
GooglePlacesObject class >> fromUrl: aUrl [
	| json result |
	json := aUrl retrieveContents.
	result := NeoJSONReader fromString: json.
	(result at: 'status') = 'OK' ifFalse: [ self error ].
	^ result values last asGooglePlacesObject: self
]

{ #category : #converting }
GooglePlacesObject >> doesNotUnderstand: aMessage [
	^ self
			at: aMessage selector
			ifAbsent: [ super doesNotUnderstand: aMessage ]
]
