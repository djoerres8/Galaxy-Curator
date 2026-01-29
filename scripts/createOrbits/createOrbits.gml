function createOrbits(num_orbits){

	// based on the total number of orbits in the level, adjust the radius of each orbit.
	// when there is 1 orbit, its radius should be 300.
	// when there are 2 orbits, the first radius will be 250 the second, 400 etc...
	// always have the largest value at the end of each array. we use this in the snapping calculation
	orbit_radii = [
		[],
		[300], 
		[250, 400], 
		[150, 280, 410],
		[150, 250, 350, 450],
		[125, 210, 295, 380, 465],
		[125, 200, 275, 350, 425, 500],
	];


	// Holds the information for each Orbit includeing its radius and what planets are on each orbit and temp planets are valid on those orbits
	orbits = [];
	for (var i = 0; i < num_orbits; i++) {
	    orbits[i] = { 
			radius: orbit_radii[num_orbits][i],
			temperature: getOrbitTemperature(num_orbits, i),
			planets: [],
			num_planets: 0,
			limit: -1
		}
	}

	return orbits;
	
}

//helps set what temp planets can go on an orbit
function getOrbitTemperature(totalOrbits, orbitNumber) {
    var last = totalOrbits - 1;

    if (orbitNumber <= floor((totalOrbits - 1) / 3)) return "hot";
    if (orbitNumber >= ceil((totalOrbits * 2) / 3)) return "cold";
    return "temperate";
}