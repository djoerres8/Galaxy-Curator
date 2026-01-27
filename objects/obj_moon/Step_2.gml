//have planet follow hand as it moves around
if(is_held && mouse_check_button(mb_left))
{
    x = mouse_x;
    y = mouse_y;
	
}
if(is_held && mouse_check_button_released(mb_left))
{
    is_held = 0;
	global.HOLDING_SOMTHING = 0;
	
	// check if moon is overlapping any planet
    var planet = instance_place(x, y, obj_planet);
	
	// if the moon is within the planet
	if (planet != noone)
	{
		
		// draw a line from the moon to the planet
		var ang = point_direction(planet.x, planet.y, x, y);	
		
		//set planet on its way to the destination
		is_traveling = 1;
		travel_destination = { x: planet.x + lengthdir_x(planet.radius, ang), y: planet.y + lengthdir_y(planet.radius, ang) };
		destination = "planet";
		
		//set orbit_radius to know which orbit the planet is in.
		orbit_radius = planet.radius + radius + orbit_distance;
		planet_id = planet;
		
	}
	// return planet to bench
	else
	{
	
		//set planet on its way back to the bench
		is_traveling = 1;
		travel_destination = { x: bench_x, y: bench_y };
		destination = "bench";
		on_bench = 1;
	}
	
}


