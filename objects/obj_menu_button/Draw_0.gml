//Draw text on button

draw_set_font(font_menu_2);

if (room == rm_level){
	draw_set_font(font_level_buttons);
}

draw_self();

//set color on whether image is 0 or 3 (unselected) or else (selected)
if (image_index == 0) || (image_index == 3)
{
	draw_set_color(c_gray);
}
else
{
	draw_set_color(c_white);
}

//align text centered
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//draw text on sprite
offset = 2;
draw_set_color(c_black);
draw_text(x+offset,y,text);
draw_text(x-offset,y,text);
draw_text(x,y+offset,text);
draw_text(x,y-offset,text);
draw_set_color(c_white);
draw_text(x,y,text)