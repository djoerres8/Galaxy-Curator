
//draw the orbits
for (var i = 0; i < level_data.orbits; i += 1)
{
	DrawOrbit(orbit_radii[level_data.orbits][i], 5, c_white);
	//draw_set_color(c_white);
	//draw_circle(obj_sun.x, obj_sun.y, orbit_radii[level_data.orbits][i], true);
}


//DEBUG
// draw level success indicator
draw_set_font(font_menu);
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(room_width/2, room_height - 50, "Level Complete: " + string(level_complete) );
