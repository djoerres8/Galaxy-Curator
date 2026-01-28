
if (obj_level_controller.level_complete == 1 && !leaving)
{
    leaving = true;
    slide_t = 0; // reset animation progress ONCE
}



if (leaving){
	
	slide_t = clamp(slide_t + slide_speed, 0, 1);

    // ease-in-back (snaps away nicely)
    var t = slide_t;
    var c1 = 1.70158;
    var c3 = c1 + 1;
    var eased = c3 * t * t * t - c1 * t * t;

    y = lerp(resting_y + 16, -sprite_height - 50, eased);

    // cool zoom
    image_xscale = lerp(1, 0.9, slide_t);
    image_yscale = image_xscale;

    if (slide_t >= 1)
    {
        instance_destroy();
    }
	
}else{
	
	// animate toward target
	slide_t = clamp(slide_t + slide_speed, 0, 1);

	// ease-out-back curve (overshoot + rebound)
	var t = slide_t;
	var c1 = 1.70158;
	var c3 = c1 + 1;
	var eased = 1 + c3 * power(t - 1, 3) + c1 * power(t - 1, 2);
	y = lerp(start_y, resting_y, eased);	
	
}