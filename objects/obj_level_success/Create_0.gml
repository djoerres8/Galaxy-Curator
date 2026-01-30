// entrance vars
animation_time = 0;
animation_duration = 40;
start_y = -sprite_height;
resting_y = room_height / 2;
created_buttons = 0;


//success sound effect
audio_play_sound(snd_level_complete,0,false);


//instance_create_layer(room_width/2,room_height/2,"Level_advance",obj_level_success);