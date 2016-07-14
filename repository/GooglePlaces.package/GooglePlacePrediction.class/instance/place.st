converting
place

	^ GooglePlace new
			id: self place_id;
			nickname: self description;
			yourself