
animation_time = min(animation_time + 1, animation_duration);

var t = animation_time / animation_duration;
var eased = 1 - power(1 - t, 3); // ease-out

y = lerp(start_y, resting_y, eased);

//create buttons
if (animation_time >= animation_duration && !created_buttons){
	instance_create_depth(room_width/2+150,room_height/2+150,-1,obj_level_advance);
	instance_create_depth(room_width/2-150,room_height/2+150,-1,obj_menu_new_game_1);
	created_buttons = 1;
}
	