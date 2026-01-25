//increase number of orbits if left click
if (mouse_check_button_pressed(mb_left)) && (position_meeting(mouse_x, mouse_y, self)){
	count = count + 1;
}

//decrease number of orbits if right click
if (mouse_check_button_pressed(mb_right)) && (position_meeting(mouse_x, mouse_y, self)){
	if (count > 0){
		count = count -1;
	}
}