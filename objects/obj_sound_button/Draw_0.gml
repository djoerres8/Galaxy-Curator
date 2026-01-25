//draw sound button
draw_sprite(spr_sound_on,0,x,y);

//draw sound off if clicked
if (global.pause){
	draw_sprite(spr_sound_off,0,x,y);
}else{
	layer_sprite_destroy(spr_sound_off);
}
