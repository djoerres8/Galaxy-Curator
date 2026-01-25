//draw sound button
draw_sprite(spr_sound_on,0,x,y);

//check if sound button has been pressed
if mouse_check_button_pressed(mb_left){
	global.pause = !global.pause;
}

//pause music if button clicked
if (global.pause){
	audio_pause_sound(snd_level_music);
	draw_sprite(spr_sound_off,0,x,y);
}else{
	audio_resume_sound(snd_level_music)
	layer_sprite_destroy(spr_sound_off);
}
