//draw sprite
draw_self();

// draw rule text
draw_set_font(font_rules);
draw_set_color(c_black);
draw_set_halign(fa_left);
draw_set_valign(fa_center);
draw_text_ext(x+70, y+32, rule, -1, sprite_width-100);
