//Play menu music when game starts
if (audio_is_playing(snd_level_music)){
	audio_stop_sound(snd_level_music)
}
audio_play_sound(snd_menu_music,0,true);