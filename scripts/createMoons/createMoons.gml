
// Bench positions for moons not in orbit. max 15 moons
global.MOON_BENCH_POSITIONS = [
	{x:608, y:256}, { x:708, y: 256}, { x:808, y: 256},
	{x:608, y:356}, { x:708, y: 356}, { x:808, y: 356},
	{x:608, y:456}, { x:708, y: 456}, { x:808, y: 456},
	{x:608, y:556}, { x:708, y: 556}, { x:808, y: 556},
	{x:608, y:656}, { x:708, y: 656}, { x:808, y: 656}
];

// this function is expecting an array of moons as defined in LEVELS, example:
// { modifier: "hotter" , count: 3 }

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

