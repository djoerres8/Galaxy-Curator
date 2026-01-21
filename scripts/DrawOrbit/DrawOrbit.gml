
//draw the orbit. need to use this method because you cant set thickness of a drawn circle so this is a workaround
function DrawOrbit(radius, thickness, color){
	draw_set_circle_precision(64);
	draw_set_colour(color); // Set the desired color
	for (var i = 0; i < thickness; i++) {
	    // Draw successive 1-pixel wide circles, increasing the radius each time
	    draw_circle(obj_sun.x, obj_sun.y, radius + i, true); 
	}
}