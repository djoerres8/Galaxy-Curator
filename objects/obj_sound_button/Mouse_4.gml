//switch music pause variable when clicking
global.pause = !global.pause;

//
if (global.pause){
	audio_pause_sound(snd_level_music);
}else{
	audio_resume_sound(snd_level_music)
}