Extension { #name : #Dictionary }

{ #category : #'*GooglePlaces' }
Dictionary >> asGooglePlacesObject: aClass [
	^ aClass newFrom: self
]
