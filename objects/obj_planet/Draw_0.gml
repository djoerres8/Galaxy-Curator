draw_self();

// draw if planet rules are passing or failing
draw_set_font(font_debug);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(x, y, string(is_passing));