// This is the function that is ran every time the player places a planet on an orbit to check if the system is stable
//returns true/false
function LevelValidation(){
	
	show_debug_message("Validating... ");
	
	//if this stays true through all check, level passed
	var valid = true;
	
	// loop through every planet instance in the level and validate it
	with (obj_planet) {
		validatePlanet(self);
		if (!is_passing){
			valid = false;	
		}
	}
	
	//Add individual level validation HERE
	
	if (!valid){
		ShowFailureMessage("fail...");
		obj_level_controller.level_complete = 0;
	}else{
		obj_level_controller.level_complete = 1;
		show_debug_message("Level Complete");
	}

}


