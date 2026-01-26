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
var sun_x = obj_sun.x;
var sun_y = obj_sun.y;
image_angle = point_direction(sun_x, sun_y, x, y) + 60;
draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, image_angle, planet_color, 1);

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
var radius_of_eye = 4; //control area of pupil
var eye_rad = radius_of_eye / sqrt( pupil_x * pupil_x + pupil_y * pupil_y + pupil_depth * pupil_depth );
var left_eye_x = x-10; //x coordinate for left eye
var right_eye_x = x+10; //x coordinate for right eye
var eye_height = y-20; //height for eyes

//draw eye for each planet
//left eye
draw_sprite(spr_eye,0,left_eye_x,eye_height);
draw_sprite(spr_pupil,0,left_eye_x+pupil_x*eye_rad,eye_height+pupil_y*eye_rad);
//right_eye
draw_sprite(spr_eye,0,right_eye_x,eye_height);
draw_sprite(spr_pupil,0,right_eye_x+pupil_x*eye_rad,eye_height+pupil_y*eye_rad);

//draw expressions
if (is_held || on_bench){
	draw_sprite(spr_neutral,0,x,y)
}else{
	if (is_passing){
		draw_sprite(spr_smile,0,x,y)
		}else{
		draw_sprite(spr_frown,0,x,y)
	}
}