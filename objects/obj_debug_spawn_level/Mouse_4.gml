//spawn orbits
if (obj_debug_set_orbits.orbits < 7){
	obj_level_controller.orbits = createOrbits(obj_debug_set_orbits.orbits);
}
else{
	obj_debug_set_orbits.orbits = 6;
	obj_level_controller.orbits = createOrbits(obj_debug_set_orbits.orbits);
}


//set planet parameters

temperature = obj_debug_set_temp.temperature[obj_debug_set_temp.pos];
shape = obj_debug_set_shape.shape[obj_debug_set_shape.pos];
size = obj_debug_set_size.size[obj_debug_set_size.pos];

planets = [temperature, shape, size];
if (planet_count < 10){
	debugPlanets(planets,planet_count);
	planet_count++;
}