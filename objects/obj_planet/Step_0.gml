
//planets should all be allowed to be grabbed
//check if cursor is over the planet and if lmb is pressed set x/y and is_held to true. Dragging is handled at end of step
if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x, mouse_y, id))
{
	x = mouse_x;
	y = mouse_y;
	is_held = true;
	on_bench = 0;
	//audio_play_sound(snd_planet_grabbed, 0, false); // sound effect
}




// if planets are on bench give them an idle bouncing animation
if (on_bench)
{
	y += sin(current_time / bob_speed) * bob_distance;
}
	