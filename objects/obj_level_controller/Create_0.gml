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
// when there are 2 orbits, the first radius will be 150 the second, 300 etc...
// always have the largest value at the end of each array. we use this in the snapping calculation
orbit_radii = [
	[],
	[300], 
	[150, 300], 
	[150, 250, 350],
	
];

// get current level data
level_data = global.LEVELS[current_level];

//tracks number of planets on the level to know where to place them on the bench
num_planets = 0;

//insert planets into the room.
for (var i = 0; i < array_length(level_data.planets); i += 1)
{
	var planet = level_data.planets[i];
	
	for (var j = 0; j < planet.count; j += 1)
	{
		var new_planet = instance_create_layer(bench_positions[num_planets].x, bench_positions[num_planets].y, "Instances", planet.type);
		new_planet.bench_position = num_planets; // set planets position on bench
		num_planets++;
	}
}



// VALIDATION VARIABLES
level_complete = false; // true when all planets are on the system and rules all pass

// Holds the information for each Orbit includeing its radius and what planets are on each orbit
orbits = [];
for (var i = 0; i < level_data.orbits; i++) {
    orbits[i] = { 
		radius: orbit_radii[level_data.orbits][i], 
		planets: [] 
	};
}


