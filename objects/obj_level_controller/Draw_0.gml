
//draw the orbits
layer = layer_get_id("Orbits"); //set layer so orbits appear below planets
for (var i = 0; i < level_data.orbits; i += 1)
{
	DrawOrbit(orbit_radii[level_data.orbits][i], 5, c_white);
}


//DEBUG
// draw level success indicator
draw_set_font(font_debug);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_text(room_width/2, room_height - 50, "Level Complete: " + string(level_complete) );
