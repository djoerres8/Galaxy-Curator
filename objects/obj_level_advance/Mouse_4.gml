//advance to next level

max_level = array_length(global.LEVELS);


var next_room = rm_level_1;
var next_level = global.CURRENT_LEVEL+1;

//if hit max level, return to main menu
if (next_level > max_level)
{
	next_room = rm_main_menu;
	global.CURRENT_LEVEL = 1;
	//gives mouse back to player
	window_set_cursor(cr_default);
}

transitionFade(next_room,next_level);