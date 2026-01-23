// controls level creation

//set current level TODO: set this dynamically based on level select or based on changing levels
current_level = 1;

// Bench positions for planets not in orbit
bench_positions = [
    {x:128, y:128}, {x:288, y:128},
    {x:128, y:256}, {x:288, y:256},
    {x:128, y:384}, {x:288, y:384},
    {x:128, y:512}, {x:288, y:512},
    {x:128, y:640}, {x:288, y:640}
];

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

// get current level data
level_data = global.LEVELS[current_level];

//create planets for level
createPlanets(level_data.planets)

//tracks number of planets on the level to know where to place them on the bench
num_planets = 0;
num_orbits = level_data.orbits;

// VALIDATION VARIABLES
level_complete = false; // true when all planets are on the system and rules all pass

// Holds the information for each Orbit includeing its radius and what planets are on each orbit and temp planets are valid on those orbits
orbits = [];
for (var i = 0; i < num_orbits; i++) {
    orbits[i] = { 
		radius: orbit_radii[level_data.orbits][i],
		temperature: getOrbitTemperature(num_orbits, i),
		planets: [] 
	};
}

//helps set what temp planets can go on an orbit
function getOrbitTemperature(totalOrbits, orbitNumber) {
    var last = totalOrbits - 1;

    if (orbitNumber <= floor((totalOrbits - 1) / 3)) return "hot";
    if (orbitNumber >= ceil((totalOrbits * 2) / 3)) return "cold";
    return "temperate";
}
