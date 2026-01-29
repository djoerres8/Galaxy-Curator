//helper functions to easily manage what happens when a planet is added or removed from orbit


function addPlanetToOrbit(planet, orbit_index){
	var orbit = obj_level_controller.orbits[orbit_index];
	
	//remove planet from orbit's index
	array_push(orbit.planets, planet);
	
	show_debug_message(string(getPlanetSize(planet)));
	
	//remove value of planet from total on orbit
	orbit.num_planets += getPlanetSize(planet);
	
	levelValidation(); // validates all planets
}


function removePlanetFromOrbit(planet, orbit_index){
	var orbit = obj_level_controller.orbits[orbit_index];
	
	//remove planet from orbit's index
	array_delete(orbit.planets, array_get_index(orbit.planets, planet), 1);
	
	//remove value of planet from total on orbit
	orbit.num_planets -= getPlanetSize(planet);
	
	
	levelValidation(); // validates all planets
}