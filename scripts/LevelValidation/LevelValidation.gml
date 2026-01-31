// This is the function that is ran every time the player places a planet on an orbit to check if the system is stable
//returns true/false
function levelValidation(){
	
	//fix edge case: this fixes accidentally clicking planets behind the next level screen
	if (obj_level_controller.level_complete == 1){
		return;	
	}
	
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
		if (!level_rules[i](0)){
			valid = 0;	
		}
	}
	
	with (obj_rule){
		image_index = global.LEVELS[global.CURRENT_LEVEL].rules[rule_index](0);	
		//reset message in case of updates
		rule = global.LEVELS[global.CURRENT_LEVEL].rules[rule_index](1);
	}
	
	// set level completion and show fail msg
	if (!valid){
		obj_level_controller.level_complete = 0;
	}else{
		obj_level_controller.level_complete = 1;
		
		//create level success window
		instance_create_layer(room_width/2,room_height+300,"Level_advance",obj_level_success);
		saveGame();
	}

}


