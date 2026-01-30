//Load level from save

//TO CHANGE, just a placeholder that takes you to the next room and level 0;
var next_room = rm_level;
var next_level = global.progress;

max_level = array_length(global.LEVELS);
//if hit max level, go to last level

if (next_level > max_level)
{
	//Need to make this last level
	global.CURRENT_LEVEL = 0;
	//gives mouse back to player
	window_set_cursor(cr_default);
}

transitionFade(next_room,next_level);