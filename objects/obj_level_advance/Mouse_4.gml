//advance to next level

max_level = 2;


var next_room = rm_level_1;
var next_level = global.current_level+1;

//if hit max level, return to main menu
if (next_level > max_level)
{
	next_room = rm_main_menu;
	global.current_level = 0;
	//gives mouse back to player
	window_set_cursor(cr_default);
}

transitionFade(next_room,next_level);