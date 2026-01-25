//Draw text on button

//Draw text on button

draw_set_font(font_menu);

draw_self();

draw_set_colour(c_black);

//align text centered
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x,y,text);