
// BEING HELD BY MOUSE
//moons should all be allowed to be grabbed
//check if cursor is over the moon and if lmb is pressed set x/y and is_held to true. 
//Dragging is handled at end of step
//global.HOLDING_SOMTHING makes sure only 1 thing can be held at a time
if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id) && !global.HOLDING_SOMTHING)
{
	//remove from planet
	if (on_planet){
		planet_id.removeMoon(self);
		on_bench = 1;
		levelValidation(); // validate
	}
	x = mouse_x;
	y = mouse_y;
	is_held = 1;
	on_bench = 0;
	on_planet = 0;
	planet_id = noone;
	global.HOLDING_SOMTHING = 1;
	//audio_play_sound(snd_planet_grabbed, 0, false); // sound effect
}

//TRAVELING TO DESTINATION
//have the planet move towards its destination. (an orbit or the bench)
if (is_traveling)
{
	//angle pointing to the destination
	var ang = point_direction(x, y, travel_destination.x, travel_destination.y);

	//move towards the destination
	x += lengthdir_x(travel_speed, ang);
	y += lengthdir_y(travel_speed, ang);
	
	if (point_distance(x, y, travel_destination.x, travel_destination.y) <= travel_speed) 
	{
        x = travel_destination.x;
        y = travel_destination.y;
        is_traveling = 0;
		
		if (destination == "planet")
		{
			//mark planet as in_orbit, set orbit_radius, validate level
			on_planet = 1;
			orbit_angle = point_direction(planet_id.x, planet_id.y, x, y); // re-calculate angle to sun	
			levelValidation();
		}
		else if (destination == "bench")
		{
			// arrived at bench
			
		}
    }
}

//IDLE BOB ANIMATION
// if planets are on bench give them an idle bouncing animation
if (!is_held && !on_planet && on_bench)
{
	y += sin(current_time / bob_speed) * bob_distance;
}
	
	
//IN ORBIT
if (on_planet)
{
	var speed_boost = 0;
	//check if moon is overlapping another moon on same planet, if so, let moon with higher ang move other freezes
	var other_moon = instance_place(x, y, obj_moon);
	if (other_moon != noone && other_moon.planet_id == planet_id){
		if (orbit_angle < other_moon.orbit_angle){
			if (orbit_angle == other_moon.orbit_angle) other_moon.orbit_angle += 5 // edge case
			//freeze and wait for space to open
			exit;	
		}else{
			speed_boost = 5;
		}
	}
	
	//reset orbit radius to account for changing planet sizes because of moons
	orbit_radius = planet_id.radius + radius + orbit_distance;
	
	// have planets orbit the sun
	orbit_angle += orbit_speed + speed_boost;
	x = planet_id.x + lengthdir_x(orbit_radius, orbit_angle);
	y = planet_id.y + lengthdir_y(orbit_radius, orbit_angle);
}