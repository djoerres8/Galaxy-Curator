
//draw the orbits
var num_orbits = level_data.orbits;
for (var i = 0; i < num_orbits; i += 1)
{
	draw_set_color(c_white);
	draw_circle(obj_sun.x, obj_sun.y, orbit_radii[num_orbits][i], true);
}