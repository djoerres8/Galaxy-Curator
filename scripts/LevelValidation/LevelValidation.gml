// This is the function that is ran every time the player places a planet on an orbit to check if the system is stable
//returns true/false
function levelValidation(){
	show_debug_message("Validating123123123123123 ");
	//fix edge case: this fixes accidentally clicking planets behind the next level screen
	if (obj_level_controller.level_complete == 1){
		show_debug_message("CAUGHT! HA nice try.");
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
		if (!level_rules[i](false)){
			valid = 0;	
		}
	}
	
	with (obj_rule){
		image_index = global.LEVELS[global.CURRENT_LEVEL].rules[rule_index](0);	
	}
	
	// set level completion and show fail msg
	if (!valid){
		showFailureMessage("fail...");
		obj_level_controller.level_complete = 0;
	}else{
		showFailureMessage("Success!!!");
		obj_level_controller.level_complete = 1;
		instance_create_layer(room_width/2,room_height/2,"Level_advance",obj_level_success);
		instance_create_depth(room_width/2+150,room_height/2+150,-1,obj_level_advance);
		instance_create_depth(room_width/2-150,room_height/2+150,-1,obj_menu_new_game_1);
		saveGame();
	}

}


