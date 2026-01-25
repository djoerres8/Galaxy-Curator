//Draw text on button

//Draw text on button

draw_set_font(font_menu);

draw_self();

draw_set_colour(c_black);

//align text centered
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x,y,text + " " + string(orbits));

//increase number of orbits if left click
if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, self)){
	orbits = orbits + 1;
}

//decrease number of orbits if right click
if (mouse_check_button_pressed(mb_right)) && (position_meeting(mouse_x, mouse_y, self)){
	if (orbits > 0){
		orbits = orbits -1;
	}
}