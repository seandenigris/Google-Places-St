baseline
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec 
			baseline: 'BabyPhexample' with: [
				spec repository: 'github://seandenigris/Baby-Phexample' ];
			baseline: 'NeoJSON' with: [
				spec repository: 'github://svenvc/NeoJSON' ].
		spec package: #GooglePlaces with: [
				spec requires: #('BabyPhexample' 'NeoJSON' ). ]. ].
