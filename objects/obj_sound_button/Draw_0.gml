//draw sound button
draw_self();

//draw sound off if clicked
if (global.PAUSE_MUSIC){
	draw_sprite(spr_sound_off,0,x,y);
}else{
	layer_sprite_destroy(spr_sound_off);
}
