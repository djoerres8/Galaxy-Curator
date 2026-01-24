function transitionFade(_room) {
	//check for transition object, add it to the instance, then run the fading transition effect
    if (!instance_exists(obj_transition)) {
        var transition_instance = instance_create_layer(0, 0, "Instances", obj_transition); // Create the transition object
        with (transition_instance) {
            fading_out = true; // Start the fade out
            target_room = _room; // Set the target room
        }
    }
}