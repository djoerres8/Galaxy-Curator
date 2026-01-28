
//draw the orbits
layer = layer_get_id("Orbits"); //set layer so orbits appear below planets
for (var i = 0; i < array_length(orbits); i += 1)
{
	//drawOrbitEllipse(orbits[i], 5, i);
	drawOrbitCircle(orbits[i], 5);
}