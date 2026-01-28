
function createLevelMessaging(rules, tutorial){
	
	var y_placement = room_height - 300;

	for (var i = 0; i < array_length(rules); i++) {
  
		var new_rule = instance_create_layer(-600, y_placement, "Instances", obj_rule);
		new_rule.rule = rules[i](1);
		new_rule.rule_index = i; 
		new_rule.y_placement = y_placement;
		new_rule.delay = 60*(i+1);
	
		y_placement += sprite_get_height(spr_level_objective_box) + 16; // space between rules

	}
	
	//also create level tutorial messgae
	var new_tutorial = instance_create_layer(room_width/2, sprite_get_height(spr_level_tutorial_box)*-1, "Instances", obj_tutorial);
	new_tutorial.tutorial = tutorial;

}