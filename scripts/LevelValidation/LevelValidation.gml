// This is the function that is ran every time the player places a planet on an orbit to check if the system is stable
//returns true/false
function levelValidation(){
	
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
	
	//Validate level rules
	var level_rules = global.LEVELS[global.CURRENT_LEVEL].rules;
	for (var i = 0; i < array_length(level_rules); i++){
		if (!level_rules[i](false)){
			valid = 0;	
		}
	}
	
	// set level completion and show fail msg
	if (!valid){
		showFailureMessage("fail...");
		obj_level_controller.level_complete = 0;
	}else{
		obj_level_controller.level_complete = 1;
		show_debug_message("Level Complete");
		instance_create_layer(window_get_width()/2,window_get_height()/2,"Level_advance",obj_level_advance);
		if (global.CURRENT_LEVEL <= global.progress){
			global.progress = global.CURRENT_LEVEL+1;
			saveGame();
		}
	}

}


