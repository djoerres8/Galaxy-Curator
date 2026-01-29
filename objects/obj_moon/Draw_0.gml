//RIPPLE EFFECT
ripple_timer++;
var t = ripple_timer / ripple_duration; // 0 → 1
var scale = lerp(1, 1.6, t); // for sprite ripple
var alpha  = lerp(ripple_starting_alpha, 0, t);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, c_white, alpha); //sprite ripple

// draw sprite
draw_self();

//Plus/Minus
if (overlay != noone){
	draw_sprite(overlay, 0, x, y);	
}

//ROTATE SHADOW
var shadow_angle = point_direction(obj_sun.x, obj_sun.y, x, y) + 60;
draw_sprite_ext(spr_moon_shadow, 0, x, y, 1, 1, shadow_angle, c_black, 1);


//HOVER CHECK
if(instance_place(x, y, obj_hand) && !global.HOLDING_SOMTHING)
{
	var draw = 1;
	
	//let planet take priority when grabbing
	if (planet_id != noone){
		if (position_meeting(mouse_x, mouse_y, planet_id)){	
			//do nothing
			draw = 0;
		}
	}
	
	if (draw && obj_hand.moon_on_top == id){
		draw_set_alpha(.33);
		draw_set_colour(c_yellow);
		draw_circle(x, y, radius+5, 0);
		draw_set_alpha(1);
	}
}