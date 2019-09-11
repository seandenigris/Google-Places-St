Class {
	#name : #GooglePlaceDetails,
	#superclass : #GooglePlacesObject,
	#category : 'GooglePlaces'
}

{ #category : #printing }
GooglePlaceDetails >> printOn: aStream [
	aStream nextPutAll: (self at: 'name')
]
