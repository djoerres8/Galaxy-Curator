//have planet follow hand as it moves around
if(is_held && mouse_check_button(mb_left))
{
    x = mouse_x;
    y = mouse_y;
	
}
if(is_held && mouse_check_button_released(mb_left))
{
    is_held = 0;
	
	//check for distance from sun	
	var distance_from_sun = point_distance(mouse_x, mouse_y, obj_sun.x, obj_sun.y);
	var current_orbits = obj_level_controller.orbit_radii[obj_level_controller.level_data.orbits];
	var largest_current_orbit = current_orbits[array_length(current_orbits)-1]; 
	// if when dropped distance from sun is within 100 of the largest orbit, find closest orbit
	
	// if the planet is within snapping range (is at least touching the outer orbit)
	if (distance_from_sun <= largest_current_orbit + radius)
	{
		
		//find which orbit the planet is closest to. (this chunk is a little confusing, easy to draw out though)
		var closest_orbit = current_orbits[0]; // initialise both to first in array.
		var closest_distance = abs(distance_from_sun - current_orbits[0]); 
		
		for (var i = 0; i < array_length(current_orbits); i += 1)
		{
			var distance_from_orbit = abs(distance_from_sun - current_orbits[i]);
			if (distance_from_orbit < closest_distance)
			{
				closest_distance = distance_from_orbit;
				closest_orbit =  current_orbits[i];
			}
		}
		
		// draw a line from the planet to the sun, place the planet along that line but at the same distance away as the found orbit
		var ang = point_direction(obj_sun.x, obj_sun.y, x, y);	
		
		//set planet on its way to the destination
		is_traveling = 1;
		travel_destination = { x: obj_sun.x + lengthdir_x(closest_orbit, ang), y: obj_sun.y + lengthdir_y(closest_orbit, ang) };
		destination = "orbit";
		
		//set orbit_radius to know which orbit the planet is in.
		orbit_radius = closest_orbit;
		
	}
	// return planet to bench
	else
	{
	
		//set planet on its way back to the bench
		is_traveling = 1;
		travel_destination = { x: obj_level_controller.bench_positions[bench_position].x, y: obj_level_controller.bench_positions[bench_position].y };
		destination = "bench";
				
	}
	
}


