// controls level creation

//set current level TODO: set this dynamically based on level select or based on changing levels
current_level = 1;

// Bench positions for planets not in orbit
bench_positions = [
    {x:128, y:128, occupied:0}, {x:288, y:128, occupied:0},
    {x:128, y:256, occupied:0}, {x:288, y:256, occupied:0},
    {x:128, y:384, occupied:0}, {x:288, y:384, occupied:0},
    {x:128, y:512, occupied:0}, {x:288, y:512, occupied:0},
    {x:128, y:640, occupied:0}, {x:288, y:640, occupied:0}
];

// based on the total number of orbits in the level, adjust the radius of each orbit.
// when there is 1 orbit, its radius should be 300.
// when there are 2 orbits, the first radius will be 200 the second, 400 etc...
orbit_radii = [
	[],
	[300], 
	[200, 400], 
	[200, 400, 600]
];

// get current level data
level_data = global.LEVELS[current_level];

//tracks number of planets on the level to know where to place them on the bench
num_planets = 0;

//insert planets into the room.
for (var i = 0; i < array_length(level_data.planets); i += 1)
{
	var planet = level_data.planets[i];
	
	for (var j = 0; j < planet.count; j += 1){
		instance_create_layer(bench_positions[num_planets].x, bench_positions[num_planets].y, "Instances", planet.type);
		num_planets++;
	}
}



