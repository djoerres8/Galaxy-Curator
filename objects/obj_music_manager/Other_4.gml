//Check if audio is already playing
if (!audio_is_playing(snd_level_music)){
	audio_play_sound(snd_level_music,0,true);
}