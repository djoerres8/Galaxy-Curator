//Variables to fade in and out

// Start fully transparent
fade_alpha = 0;
fade_speed = 0.02; // Adjust the speed of the fade
fading_out = false; // Flag to track if we are fading out or in
target_room = noone; // Variable to store the room to go to

//Set GUI variables
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
