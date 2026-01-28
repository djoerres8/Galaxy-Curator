
//draw the orbits
layer = layer_get_id("Orbits"); //set layer so orbits appear below planets
for (var i = 0; i < array_length(orbits); i += 1)
{
	//drawOrbitEllipse(orbits[i], 5, i);
	drawOrbitCircle(orbits[i], 5);
}


//Tutorial Messages
draw_set_font(font_tutorial);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(room_width/2, 50, global.LEVELS[global.CURRENT_LEVEL].tutorial );
