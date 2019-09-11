Extension { #name : #Array }

{ #category : #'*GooglePlaces' }
Array >> asGooglePlacesObject: aClass [
	^ self collect: [ :d | aClass newFrom: d ]
]
