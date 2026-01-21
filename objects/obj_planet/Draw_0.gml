
//RIPPLE EFFECT
ripple_timer++;
var t = ripple_timer / ripple_duration; // 0 → 1
var ripple_radius = lerp(radius, (radius+30), t);
var alpha  = lerp(ripple_starting_alpha, 0, t);

draw_set_alpha(alpha);
draw_set_color(c_white);
draw_circle(x, y, ripple_radius, false);
draw_set_alpha(1); // reset alpha for other draws


// draw sprite
draw_self();

// draw if planet rules are passing or failing
draw_set_font(font_debug);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x, y, string(is_passing));