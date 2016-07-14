*GooglePlaces
asGooglePlacesObject: aClass
	^ self collect: [ :d | aClass newFrom: d ]