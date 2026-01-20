
// BEING HELD BY MOUSE
//planets should all be allowed to be grabbed
//check if cursor is over the planet and if lmb is pressed set x/y and is_held to true. Dragging is handled at end of step
if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
{
	x = mouse_x;
	y = mouse_y;
	is_held = 1;
	on_bench = 0;
	in_orbit = 0;
	//audio_play_sound(snd_planet_grabbed, 0, false); // sound effect
}

//TRAVELING TO DESTINATION
//have the planet move towards its destination. (an orbit or the bench)
if (is_traveling)
{

	var ang = point_direction(x, y, travel_destination.x, travel_destination.y);
	x += lengthdir_x(travel_speed, ang);
	y += lengthdir_y(travel_speed, ang);
	
	if (point_distance(x, y, travel_destination.x, travel_destination.y) <= travel_speed) 
	{
        x = travel_destination.x;
        y = travel_destination.y;
        is_traveling = 0;
		show_debug_message("done traveling");
		
		if (destination == "orbit")
		{
			//mark planet as in_orbit, set orbit_radius
			in_orbit = 1;
			orbit_angle = point_direction(obj_sun.x, obj_sun.y, x, y); // re-calculate angle to sun	
		}
		else if (destination == "bench")
		{
			//mark planet as in_orbit, set orbit_radius
			on_bench = 1;
			
		}
    }
}

//IDLE BOB ANIMATION
// if planets are on bench give them an idle bouncing animation
if (!is_held && !in_orbit && on_bench)
{
	y += sin(current_time / bob_speed) * bob_distance;
}
	
	
//IN ORBIT
if (in_orbit)
{
	// have planets orbit the sun
	orbit_angle += orbit_speed;
	x = obj_sun.x + lengthdir_x(orbit_radius, orbit_angle);
	y = obj_sun.y + lengthdir_y(orbit_radius, orbit_angle);
}