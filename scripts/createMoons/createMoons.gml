
// Bench positions for moons not in orbit. max 16 moons
global.MOON_BENCH_POSITIONS = [
	{x:448, y:128}, {x:608, y:128},
	{x:448, y:256}, {x:608, y:256},
	{x:448, y:384}, {x:608, y:384},
	{x:448, y:512}, {x:608, y:512},
	{x:448, y:640}, {x:608, y:640},
	{x:448, y:768}, {x:608, y:768},
	{x:448, y:896}, {x:608, y:896},
	{x:448, y:1024}, {x:608, y:1024}
];

// this function is expecting an array of moons as defined in LEVELS, example:


//given an array of moons, create the moon instances
function createMoons(moons) {
	
	//tracks number of planets on the level to know where to place them on the bench
	var moon_num = 0;

	//insert moons into the room.
	for (var i = 0; i < array_length(moons); i += 1)
	{
		var moon_def = moons[i];
	
		for (var j = 0; j < moon_def.count; j += 1)
		{
			createMoon(moon_def, moon_num);
			moon_num++;
		}
	}
}

// create a single moon
// moon_def = { modifier: "", count: # },
function createMoon(moon_def, moon_num){
	
	var bench_positions = global.MOON_BENCH_POSITIONS;
	var new_moon = instance_create_layer(bench_positions[moon_num].x, bench_positions[moon_num].y, "Instances", obj_moon);
	
	// set where moon spawns
	new_moon.bench_x = bench_positions[moon_num].x; //set planet bench x & y so it knows where to sit
	new_moon.bench_y = bench_positions[moon_num].y;
	
	//set moon modifier and visual
	new_moon.modifier = moon_def.modifier;
	new_moon.applyMoonVisuals();
}

