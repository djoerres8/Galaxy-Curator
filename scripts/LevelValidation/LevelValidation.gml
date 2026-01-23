// This is the function that is ran every time the player places a planet on an orbit to check if the system is stable
//returns true/false
function LevelValidation(){
	
	show_debug_message("Validating... ");
	
	//if this stays true through all check, level passed
	var valid = true;
	
	//get all planets in orbit
	var planets = obj_level_controller.orbits;
	
	//total orbits
	var total_orbits = obj_level_controller.level_data.orbits;
	
	//first check that all planets are in orbit
	with (obj_planet) {
		if (on_bench){
			valid = false;	
		}
	}
	
	if (!valid){
		ShowFailureMessage("Not all planets are in orbit.");
		return false;
	}
	
	
	// check cold planets
	
	//loop through every planet
	//if planet is cold_planet. 
	//check planet is on "cold_orbit"
	
	//loop through every orbit in the level
	for (var i = 0; i < array_length(obj_level_controller.orbits); i++) {
		
		var orbit_to_check = obj_level_controller.orbits[i];
		
		//loop through every planet in the orbit
		for (var j = 0; j < array_length(orbit_to_check.planets); j++){
			
			var planet_to_check = obj_level_controller.orbits[i].planets[j];
			
			//left off here.. might switch to modular planet typing...
			//if (planet_to_check.temperature != "any"){
			//	if (planet_to_check.temperature)	
			//}
			
		}
		
		show_debug_message("Orbit #: " + string(i+1) + ". Number of planets: " + string(array_length(obj_level_controller.orbits[i].planets)));
	}


	// are all planets in orbit
	//if (planets_on_bench != 0){
	//	return false;	
	//}
	
	// check rules
}


