tests
test1
	| predictions |
	ZnConnectionTimeout 
		value: 1
		during: [ predictions := GooglePlacePrediction selectMatching: 'NRFD Station 1' ].
	predictions first place id should equal: 'ChIJZbY93ZGNwokRInZmFNUzg3M'.
	predictions first details formatted_address should equal: '45 Harrison St, New Rochelle, NY 10801, USA'