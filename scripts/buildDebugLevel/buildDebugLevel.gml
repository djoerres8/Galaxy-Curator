

function debugPlanets(planets,planet_count) {
	
	//tracks number of planets on the level to know where to place them on the bench
	bench_positions = [
	    {x:128, y:128}, {x:288, y:128},
	    {x:128, y:256}, {x:288, y:256},
	    {x:128, y:384}, {x:288, y:384},
	    {x:128, y:512}, {x:288, y:512},
	    {x:128, y:640}, {x:288, y:640},
		{x:128, y:768}, {x:288, y:768},
		{x:128, y:896}, {x:288, y:896},
		{x:128, y:1024}, {x:288, y:1024}
	];
	
	//insert planets into the room.
	var new_planet = instance_create_layer(bench_positions[planet_count].x, bench_positions[planet_count].y, "Instances", obj_planet);
	new_planet.bench_x = bench_positions[planet_count].x; //set planet bench x & y so it knows where to sit
	new_planet.bench_y = bench_positions[planet_count].y;
	new_planet.temperature = planets[0];
    new_planet.shape       = planets[1];
    new_planet.size        = planets[2];
	new_planet.applyVisuals();
}