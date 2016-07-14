printing
printOn: aStream
	nickname ifNotNil: [ :nn | aStream nextPutAll: nn ]