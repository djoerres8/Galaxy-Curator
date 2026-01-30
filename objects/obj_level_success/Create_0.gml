// entrance vars
animation_time = 0;
animation_duration = 40;
start_y = -sprite_height;
resting_y = room_height / 2;
created_buttons = 0;


//success sound effect
audio_play_sound(snd_level_complete,0,false);

ps = part_system_create_layer("Assets", false);
part_particles_burst(ps, room_width/2, room_height, ps_confetii_blue);
part_particles_burst(ps, room_width/2, room_height, ps_confetii_red);
part_particles_burst(ps, room_width/2, room_height, ps_confetii_yellow);
part_particles_burst(ps, room_width/2, room_height, ps_confetii_orange);
part_particles_burst(ps, room_width/2, room_height, ps_confetii_purple);
part_particles_burst(ps, room_width/2, room_height, ps_confetii_green);

//instance_create_layer(room_width/2,room_height/2,"Level_advance",obj_level_success);