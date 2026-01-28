//draw sprite
draw_self();

// draw rule text
draw_set_font(font_tutorial);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text_ext(x, y+(sprite_height/2), tutorial, -1, sprite_width-100);
