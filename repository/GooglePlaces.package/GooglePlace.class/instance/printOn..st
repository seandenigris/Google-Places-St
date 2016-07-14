as yet unclassified
printOn: aStream
	nickname ifNotNil: [ :nn | aStream nextPutAll: nn ]