// This is the function that is ran every time the player places a planet on an orbit to check if the system is stable
//returns true/false
function LevelValidation(){
	
	show_debug_message("Validating... ");
	
	for (var i = 0; i < array_length(obj_level_controller.orbits); i++) {
		show_debug_message("Orbit #: " + string(i+1) + ". Number of planets: " + string(array_length(obj_level_controller.orbits[i].planets)));
	}


	// are all planets in orbit
	//if (planets_on_bench != 0){
	//	return false;	
	//}
	
	// check rules
}