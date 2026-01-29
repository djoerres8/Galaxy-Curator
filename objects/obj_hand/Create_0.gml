//set cursor to be invisible in game window
window_set_cursor(cr_none);

moon_on_top = noone; // keep track of what instance of moon/planet is highest in view order
planet_on_top = noone;
moon_held = noone;
global.HOLDING_SOMTHING = false; // keeps track of what is being dragged and makes sure only 1 thing can be grabbed at a time