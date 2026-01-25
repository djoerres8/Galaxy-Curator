//switch music pause variable when clicking
global.pause = !global.pause;

//check pause music state to pause or resume music
if (global.pause){
	audio_pause_sound(snd_level_music);
}else{
	audio_resume_sound(snd_level_music)
}