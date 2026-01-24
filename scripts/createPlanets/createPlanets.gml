// rules for all planet types go here
// better to have them all centralized and global so during validation they can be checked easier.

//given a level, create the planet instances
function createPlanets(planets) {
	
	//tracks number of planets on the level to know where to place them on the bench
	var planet_num = 0;

	//insert planets into the room.
	for (var i = 0; i < array_length(planets); i += 1)
	{
		var planet_def = planets[i];
	
		for (var j = 0; j < planet_def.count; j += 1)
		{
			var new_planet = instance_create_layer(bench_positions[planet_num].x, bench_positions[planet_num].y, "Instances", obj_planet);
			new_planet.bench_position = planet_num; // set planets position on bench
			new_planet.temperature = planet_def.temperature;
            new_planet.shape       = planet_def.shape;
            new_planet.size        = planet_def.size;
			new_planet.applyVisuals();
			planet_num++;
		}
	}
}

