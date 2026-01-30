//Draw Event

//highlight button when hovering
if (hover = 0){
	draw_sprite_ext(spr_mini_system,-1,x,y,1,1,0,merge_color(c_white,c_black,0.25),1);
}else{
	draw_self();
}
//draw_text(x,y,level_select_option+1); //draw button and add 1 to level to start level UI at 1
//align text centered
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw text on sprite
offset = 2;
draw_set_color(c_black);
draw_text(x+offset,y,level_select_option);
draw_text(x-offset,y,level_select_option);
draw_text(x,y+offset,level_select_option);
draw_text(x,y-offset,level_select_option);
draw_set_color(c_white);
draw_text(x,y,level_select_option);