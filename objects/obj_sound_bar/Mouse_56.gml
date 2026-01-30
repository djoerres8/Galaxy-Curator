is_being_dragged = false;

if (!global.PAUSE_MUSIC){
	audio_sound_gain(snd_level_music, global.VOLUME/100, 0);
	audio_sound_gain(snd_planet_grab, global.VOLUME/100, 0);
	audio_sound_gain(snd_level_complete, global.VOLUME/100, 0);
	audio_sound_gain(snd_pop_in, global.VOLUME/100, 0);
	audio_sound_gain(snd_hover, global.VOLUME/100, 0);
}
