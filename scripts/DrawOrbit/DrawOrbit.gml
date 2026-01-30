
//draw the orbit. need to use this method because you cant set thickness of a drawn circle so this is a workaround
function drawOrbitEllipse(orbit, thickness, orbit_num){
	var radius = orbit.radius;
	var wobble = sin(current_time * 0.001 + radius) * 0.8; // adds a bit of movement to the orbits so they arent static
	thickness = 8;
	radius = radius + wobble;
	var vertical_offset = obj_sun.y + orbit_num * 25; // 25 is the offset value
	draw_set_circle_precision(64);
	draw_set_colour(getColor(orbit.temperature)); // Set the desired color
	for (var i = 0; i < thickness; i++) {
	    // Draw successive 1-pixel wide circles, increasing the radius each time
		draw_ellipse(
			obj_sun.x - (radius + (i/3)),
			vertical_offset - (radius)/2,
			obj_sun.x + (radius + (i/3)),
			vertical_offset + (radius + i)/2,
			true
		);
	}
	
	//draw orbit glow
	var alpha_dropoff = [.6, .55, .5, .45, .4, .35, .3, .25, .2, .15, .1, .09, .08, .07, .06, .05, .04, .03, .02, .01];
	
	for (var i = 0; i < 20; i++) {
		draw_set_alpha(alpha_dropoff[i]);
		draw_ellipse(
			obj_sun.x - (radius + (i/3)),
			vertical_offset - (radius)/2,
			obj_sun.x + (radius + (i/3)),
			vertical_offset + (radius + i + 8)/2,
			true
		);
	}
	
	for (var i = 0; i < 20; i++) {
		draw_set_alpha(alpha_dropoff[i]);
		draw_ellipse(
			obj_sun.x - (radius + ((i*-1)/3)),
			vertical_offset - (radius)/2,
			obj_sun.x + (radius + ((i*-1)/3)),
			vertical_offset + (radius + (i*-1))/2,
			true
		);
	}
	
	draw_set_alpha(1);
}


function getColor(temp){
	switch (temp)
	{
	    case "hot":
	        return merge_colour(c_white, c_red, .5);

	    case "cold":
	        return merge_colour(c_white, c_blue, .5);

	    case "temperate":
	        return merge_colour(c_white, c_green, .5);
	    default:
	        return c_white
	}
}


//draw the orbit. need to use this method because you cant set thickness of a drawn circle so this is a workaround
function drawOrbitCircle(orbit, thickness){
	
	draw_set_circle_precision(64);
	draw_set_colour(getColor(orbit.temperature)); // Set the desired color
	for (var i = 0; i < thickness; i++) {
	    // Draw successive 1-pixel wide circles, increasing the radius each time
	    draw_circle(obj_sun.x, obj_sun.y, orbit.radius + i, true); 
	}
	
	if (orbit.limit != -1){
		//draw how many planets in the orbit at base of orbit
		draw_set_font(font_rules);
	    draw_set_halign(fa_center);
	    draw_set_valign(fa_top);
	    draw_text(obj_sun.x, obj_sun.y + orbit.radius + thickness + 4, string(orbit.num_planets)+"/"+string(orbit.limit));
	}
}



function drawOrbitHighlight(){

	//player is holding a planet
	if(obj_hand.moon_held == noone && global.HOLDING_SOMTHING)
	{
	
		var planet = obj_hand.planet_held;
		//check for distance from sun	
		var distance_from_sun = point_distance(mouse_x, mouse_y, obj_sun.x, obj_sun.y);
	
		// if the planet is within snapping range (is at least touching the outer orbit)
		if (distance_from_sun <= array_last(obj_level_controller.orbits).radius + (planet.radius *3))
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
		
			//// draw a line from the planet to the sun, place the planet along that line but at the same distance away as the found orbit
			//var ang = point_direction(obj_sun.x, obj_sun.y, x, y);	
		
			////set planet on its way to the destination
			//is_traveling = 1;
			//travel_destination = { x: obj_sun.x + lengthdir_x(obj_level_controller.orbits[closest_orbit].radius, ang), y: obj_sun.y + lengthdir_y(obj_level_controller.orbits[closest_orbit].radius, ang) };
			//destination = "orbit";
		
			////set orbit_radius to know which orbit the planet is in.
			//orbit_radius = obj_level_controller.orbits[closest_orbit].radius;
			//orbit_index = closest_orbit;
			
			orbit_radius = obj_level_controller.orbits[closest_orbit].radius;
			
			//draw glow
			for (var i = 0; i < 50; i++) {
				draw_set_alpha(.1);
				draw_set_colour(c_yellow); // Set the desired color
				draw_circle(obj_sun.x, obj_sun.y, orbit_radius + i, true); 
				draw_circle(obj_sun.x, obj_sun.y, orbit_radius + (-1*i), true); 
				
			}	
			draw_set_alpha(1);
		
		}
		
	
	}
	
}