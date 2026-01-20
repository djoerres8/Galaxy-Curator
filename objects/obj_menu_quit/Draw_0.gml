//Draw text on button

draw_set_font(font_menu);

draw_self();

//set color on whether image is 0 or 3 (unselected) or else (selected)
if (image_index == 0) || (image_index == 2)
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
draw_text(x,y,text);