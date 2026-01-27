//RIPPLE EFFECT
ripple_timer++;
var t = ripple_timer / ripple_duration; // 0 → 1
var scale = lerp(1, 1.6, t); // for sprite ripple
var alpha  = lerp(ripple_starting_alpha, 0, t);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale * scale, image_yscale * scale, image_angle, c_white, alpha); //sprite ripple

// draw sprite
draw_self();

//ROTATE SHADOW
image_angle = point_direction(obj_sun.x, obj_sun.y, x, y) + 60;