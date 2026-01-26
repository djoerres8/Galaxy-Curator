function transitionFade(_room,_level) {
	//check for transition object, add it to the instance, then run the fading transition effect
	//This also changes level, so specify the rm_level_1 and then which level to move to
    if (!instance_exists(obj_transition)) {
        var transition_instance = instance_create_layer(0, 0, "Instances", obj_transition); // Create the transition object
        with (transition_instance) {
            fading_out = true; // Start the fade out
            target_room = _room; // Set the target room
		}
		//If no level, then default to room 1.  Otherwise set to level passed in
		if (_level != undefined) 
		{
			global.CURRENT_LEVEL = _level;
		}
		else 
		{
			global.CURRENT_LEVEL = 1;
		}
    }
}