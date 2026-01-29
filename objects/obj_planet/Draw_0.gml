//RIPPLE EFFECT
ripple_timer++;
var t = ripple_timer / ripple_duration; // 0 → 1
var scale = lerp(1, 1.6, t); // for sprite ripple
var alpha  = lerp(ripple_starting_alpha, 0, t);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, c_white, alpha); //sprite ripple

//PLANET GLOW
for (var i = 0; i < glow_num; i++){
	draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * glow_scale[i], image_yscale * glow_scale[i], image_angle, merge_color(planet_color, c_white, 0.5), glow_alpha[i]); //sprite ripple
}

// draw sprite
draw_self();

//ROTATE SHADOW
//image_angle = point_direction(obj_sun.x, obj_sun.y, x, y) + 60;
var shadow_angle = point_direction(obj_sun.x, obj_sun.y, x, y) + 60;
switch(shape){
	case "circle": draw_sprite_ext(spr_planet_circle_shadow, 0, x, y, image_xscale, image_yscale, shadow_angle, c_black, 1); break;
	case "heart": draw_sprite_ext(spr_planet_heart_shadow, 0, x, y, image_xscale, image_yscale, shadow_angle, c_black, 1); break;
	case "spiky": draw_sprite_ext(spr_planet_spiky_shadow, 0, x, y, image_xscale, image_yscale, shadow_angle, c_black, 1); break;
}


// draw if planet rules are passing or failing
//draw_set_font(font_debug);
//draw_set_color(c_white);
//draw_set_halign(fa_center);
//draw_set_valign(fa_center);
//draw_text(x, y, string(is_passing));

//EYEBALLS
var pupil_x = mouse_x - x;
var pupil_y = mouse_y - y;
var pupil_depth = 100;  //depth between eye and mouse
var radius_of_eye = 4*image_xscale; //control area of pupil
var eye_rad = radius_of_eye / sqrt( pupil_x * pupil_x + pupil_y * pupil_y + pupil_depth * pupil_depth );
var left_eye_x = x-(10*image_xscale); //x coordinate for left eye
var right_eye_x = x+(10*image_xscale); //x coordinate for right eye
var eye_height = y-(20*image_yscale); //height for eyes

//draw eye for each planet
//left eye
draw_sprite_ext(spr_eye,0,left_eye_x,eye_height, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(spr_pupil,0,left_eye_x+pupil_x*eye_rad,eye_height+pupil_y*eye_rad, image_xscale, image_yscale, 0, c_white, 1);
//right_eye
draw_sprite_ext(spr_eye,0,right_eye_x,eye_height, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(spr_pupil,0,right_eye_x+pupil_x*eye_rad,eye_height+pupil_y*eye_rad, image_xscale, image_yscale, 0, c_white, 1);

//draw expressions
if (obj_level_controller.level_complete){
	draw_sprite_ext(spr_super_happy, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
}else if (on_bench){
	draw_sprite_ext(spr_neutral, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
}else if (is_held){
	draw_sprite_ext(spr_held, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
}else{
	if (is_passing){
		draw_sprite_ext(spr_smile, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
		}else{
		draw_sprite_ext(spr_frown, 0, x, y, image_xscale, image_yscale, 0, c_white, 1);
	}
}