//switch music pause variable when clicking
global.PAUSE_MUSIC = !global.PAUSE_MUSIC;

//check pause music state to pause or resume music
if (global.PAUSE_MUSIC){
	audio_pause_sound(snd_level_music);
	//mute sound effects
	audio_sound_gain(snd_level_music, 0/100, 0);
	audio_sound_gain(snd_planet_grab, 0/100, 0);
	audio_sound_gain(snd_level_complete, 0/100, 0);
	audio_sound_gain(snd_pop_in, 0/100, 0);
	audio_sound_gain(snd_hover, 0/100, 0);

}else{
	if (!audio_is_playing(snd_level_music)){
		audio_play_sound(snd_level_music,0,true);
	}else{
		audio_resume_sound(snd_level_music);
	}
	//resume sound effects
	audio_sound_gain(snd_level_music, global.VOLUME/100, 0);
	audio_sound_gain(snd_planet_grab, global.VOLUME/100, 0);
	audio_sound_gain(snd_level_complete, global.VOLUME/100, 0);
	audio_sound_gain(snd_pop_in, global.VOLUME/100, 0);
	audio_sound_gain(snd_hover, global.VOLUME/100, 0);
}