// DEBUG

// draw if planet rules are passing or failing
draw_set_font(font_menu);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(x, y+sprite_height/2+5, string(is_passing));