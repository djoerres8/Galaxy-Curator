
//draw the orbit. need to use this method because you cant set thickness of a drawn circle so this is a workaround
function DrawOrbit(radius, thickness, color, orbit_num){
	var wobble = sin(current_time * 0.001 + radius) * 0.8; // adds a bit of movement to the orbits so they arent static
	thickness = 8;
	radius = radius + wobble;
	var vertical_offset = obj_sun.y + orbit_num * 25; // 25 is the offset value
	draw_set_circle_precision(64);
	draw_set_colour(color); // Set the desired color
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