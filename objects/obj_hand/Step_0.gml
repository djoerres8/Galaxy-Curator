

//set hand to folow cursors position
x = mouse_x;
y = mouse_y;

//set it top appear over the top of all other elements
depth = -1;

//open/close hand on left mouse byn press
if mouse_check_button(mb_left)
{
	sprite_index = spr_hand_closed;
}
else
{
	sprite_index = spr_hand_open;
}



