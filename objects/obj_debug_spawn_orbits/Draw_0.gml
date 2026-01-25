//Draw text on button

draw_set_font(font_menu_2);

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
draw_text(x,y,text + " " + string(orbits));

//increase number of orbits if left click
if (mouse_check_button_pressed(mb_left)){
	orbits = orbits + 1;
}

//decrease number of orbits if right click
if (mouse_check_button_pressed(mb_right)){
	if (orbits > 0){
		orbits = orbits -1;
	}
}

//draw orbits on middle click
if (mouse_check_button_pressed(mb_middle)){
	obj_level_controller.orbits = createOrbits(orbits);
	//drawOrbitCircle(orbits,1);
}