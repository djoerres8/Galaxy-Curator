
//given a planet figure out if its passing all its own rules
//planet param is an instance of obj_planet
function validatePlanet(planet){
	
	var temperature_passing = 1;
	var shape_passing = 1;
	var size_passing = 1; // always 1 currently
	var error_msg = "failing...";
	
	var orbits = obj_level_controller.orbits; // all information about planerts on each orbit of the level lives in here
	
	//catch edge cases
	if (planet.orbit_index == -1){
		planet.is_passing = 0;
		return;	
	}
	
	//TEMPERATURE
	if (orbits[planet.orbit_index].temperature != planet.temperature && planet.temperature != "any"){
		temperature_passing = 0;
	}
	
	
	// SHAPE
	
	//spikey need to be alone on orbit
	if (planet.shape == "spiky" && array_length(orbits[planet.orbit_index].planets) > 1){
		shape_passing = 0;
	}
	
	//heart needs at least 1 pal
	if (planet.shape == "heart" && array_length(orbits[planet.orbit_index].planets) == 1){
		shape_passing = 0;
	}
	
	
	// OLD SIZE check planets on adjacent orbits
	//if (planet.size != "circle"){
		
	//	//loop through planets in outer orbit
	//	//if not max orbit, check outer orbit
	//	if (planet.orbit_index+1 != array_length(orbits)){
	//		for (var i = 0; i <  array_length(orbits[planet.orbit_index+1].planets); i++){
	//			if (
	//			(orbits[planet.orbit_index+1].planets[i].size == "small" && planet.size == "large") ||
	//			(orbits[planet.orbit_index+1].planets[i].size == "large" && planet.size == "small")){
	//				size_passing = 0;
	//			}
	//		}
	//	}
		
	//	//loop through planets in inner orbit
	//	//if not min orbit, check inner orbit
	//	if (planet.orbit_index != 0){
	//		for (var i = 0; i <  array_length(orbits[planet.orbit_index-1].planets); i++){	
	//			if (
	//			(orbits[planet.orbit_index-1].planets[i].size == "small" && planet.size == "large") ||
	//			(orbits[planet.orbit_index-1].planets[i].size == "large" && planet.size == "small")){
	//				size_passing = 0;
	//			}
	//		}
	//	}
	//}
	
	if (size_passing && temperature_passing && shape_passing && !planet.on_bench){
		planet.is_passing = 1;	
	}else{
		planet.is_passing = 0;
		planet.failure_msg = error_msg;
		//show_debug_message(planet.shape + "| size: " + string(size_passing) + "| shape: " + string(shape_passing) + "| temp: " + string(temperature_passing));
	}
	
}