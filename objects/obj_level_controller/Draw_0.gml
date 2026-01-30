
//draw the orbits
layer = layer_get_id("Orbits"); //set layer so orbits appear below planets

//if hand is holding a planet and is within range of orbit, draw a highlight
drawOrbitHighlight();

//draw the orbits
for (var i = 0; i < array_length(orbits); i += 1)
{
	//drawOrbitEllipse(orbits[i], 5, i);
	drawOrbitCircle(orbits[i], 5);
}


//draw current level #
draw_set_font(font_menu);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_colour(c_white);
draw_text(10, 12, "Level: "+ string(global.CURRENT_LEVEL));