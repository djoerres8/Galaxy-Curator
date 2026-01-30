//advance to next level

var next_room = rm_level;
var next_level = global.CURRENT_LEVEL+1;

//if hit max level, go to level complete screen
show_debug_message("curent level: " + string(next_level));
show_debug_message("total levels: " + string(array_length(global.LEVELS)));
if (next_level >= array_length(global.LEVELS))
{
	next_room = rm_game_complete;
	//gives mouse back to player
	window_set_cursor(cr_default);
}


transitionFade(next_room,next_level);