
// Bench positions for planets not in orbit. max 16 planets
global.BENCH_POSITIONS = [
	{x:128, y:128}, {x:288, y:128},
	{x:128, y:256}, {x:288, y:256},
	{x:128, y:384}, {x:288, y:384},
	{x:128, y:512}, {x:288, y:512},
	{x:128, y:640}, {x:288, y:640},
	{x:128, y:768}, {x:288, y:768},
	{x:128, y:896}, {x:288, y:896},
	{x:128, y:1024}, {x:288, y:1024}
];

// this function is expecting an array of planets as defined in LEVELS, example:
//planets: [
//      { temperature: "hot", shape: "circle", size: "medium" , count: 1 },
//		{ temperature: "cold", shape: "circle", size: "medium" , count: 1 },
//		{ temperature: "temperate", shape: "circle", size: "medium" , count: 1 },
//    ],

//given an array of planets, create the planet instances
function createPlanets(planets) {
	
	//tracks number of planets on the level to know where to place them on the bench
	var planet_num = 0;

	//insert planets into the room.
	for (var i = 0; i < array_length(planets); i += 1)
	{
		var planet_def = planets[i];
	
		for (var j = 0; j < planet_def.count; j += 1)
		{
			createPlanet(planet_def, planet_num);
			planet_num++;
		}
	}
}

// create a single planet
// planet_def = { temperature: "", shape: "", size: "" , count: # },
function createPlanet(planet_def, planet_num){
	
	var bench_positions = global.BENCH_POSITIONS;
	var new_planet = instance_create_layer(bench_positions[planet_num].x, bench_positions[planet_num].y, "Instances", obj_planet);
	
	// set where planet spawns
	new_planet.bench_x = bench_positions[planet_num].x; //set planet bench x & y so it knows where to sit
	new_planet.bench_y = bench_positions[planet_num].y;
	
	//set planet attributes
	new_planet.temperature = planet_def.temperature;
    new_planet.shape       = planet_def.shape;
    new_planet.size        = planet_def.size;
	new_planet.applyVisuals();
}

