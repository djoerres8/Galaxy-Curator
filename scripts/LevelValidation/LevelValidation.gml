// This is the function that is ran every time the player places a planet on an orbit to check if the system is stable
//returns true/false
function LevelValidation(){
	
	show_debug_message("Validating... ");
	
	//if this stays true through all check, level passed
	var valid = true;
	
	//get all orbits
	var orbits = obj_level_controller.orbits;
	
	//total orbits
	var total_orbits = obj_level_controller.num_orbits;
	
	
	// loop through every orbit
	//for (var i = 0; i < total_orbits; i++) {
		
	//	//loop through every planet in the orbit
	//	for (var j = 0; j < array_length(orbits[i].planets); j++){
			
	//		//validate planets in orbit
	//		validatePlanet(orbits[i].planets[j]);
	//	}
		
	//}
	
	
	with (obj_planet) {
		validatePlanet(self);
		if (!is_passing){
			valid = false;	
		}
	}
	
	if (!valid){
		ShowFailureMessage("fail...");
		obj_level_controller.level_complete = 0;
	}else{
		obj_level_controller.level_complete = 1;
		show_debug_message("Level Complete");
	}

}


