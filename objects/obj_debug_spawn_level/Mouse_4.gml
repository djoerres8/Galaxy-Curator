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

planets = [temperature, shape, size]; // replace with struct. (same format as they are in LEVELS)
if (planet_count < 10){
	debugPlanets(planets,planet_count); // replace with createPlanet()
	planet_count++;
}


//suggestion from David:
/*

1 - 
Use and modify global.LEVELS[999] to keep track of all the information on the debug level. //why? 

2-
make 2 spawn buttons. 
one for setting # of orbits. (this should call buildLevel()) because: changing the # of orbits, should reset all planets to the bench and keep validation correct.
one for spawning planets. (this should call createPlanet()) 




I cleaned up my code a lot so it should be easier to read and use, but please ask questions if you have them.

I took all the creation logic out of obj_level_controller and moved it to the function buildLevel().
that builds all parts of a level; orbits and planets, based off of the current level (999 for debug) and level definitions (global.LEVELS[999])

function createPlanet() is new and spawns a single planet. the code is the same as i had before, i just moved it to its own function so you could access it easier.

*/