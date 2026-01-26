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
	
	//check for distance from sun	
	var distance_from_sun = point_distance(mouse_x, mouse_y, obj_sun.x, obj_sun.y);
	
	// if the planet is within snapping range (is at least touching the outer orbit)
	if (distance_from_sun <= array_last(obj_level_controller.orbits).radius + (radius *3))
	{
		
		//find which orbit the planet is closest to. (this chunk is a little confusing, easy to draw out though)
		var closest_orbit = 0; // initialise both to first in array.
		var closest_distance = abs(distance_from_sun - obj_level_controller.orbits[0].radius); 
		
		for (var i = 0; i < array_length(obj_level_controller.orbits); i += 1)
		{
			var distance_from_orbit = abs(distance_from_sun - obj_level_controller.orbits[i].radius);
			if (distance_from_orbit < closest_distance)
			{
				closest_distance = distance_from_orbit;
				closest_orbit =  i;
			}
		}
		
		// draw a line from the planet to the sun, place the planet along that line but at the same distance away as the found orbit
		var ang = point_direction(obj_sun.x, obj_sun.y, x, y);	
		
		//set planet on its way to the destination
		is_traveling = 1;
		travel_destination = { x: obj_sun.x + lengthdir_x(obj_level_controller.orbits[closest_orbit].radius, ang), y: obj_sun.y + lengthdir_y(obj_level_controller.orbits[closest_orbit].radius, ang) };
		destination = "orbit";
		
		//set orbit_radius to know which orbit the planet is in.
		orbit_radius = obj_level_controller.orbits[closest_orbit].radius;
		orbit_index = closest_orbit;
		
	}
	// return planet to bench
	else
	{
	
		//set planet on its way back to the bench
		is_traveling = 1;
		travel_destination = { x: obj_level_controller.bench_positions[bench_position].x, y: obj_level_controller.bench_positions[bench_position].y };
		destination = "bench";
		on_bench = 1;
	}
	
}


