
function createLevelRules(rules){
	
var y_placement = room_height - 300;

for (var i = 0; i < array_length(rules); i++) {
  
	var new_rule = instance_create_layer(10, y_placement, "Instances", obj_rule);
	new_rule.rule = rules[i](1);
	new_rule.rule_index = i; 
	new_rule.y_placement = y_placement;
	
	y_placement += sprite_get_height(spr_level_objective_box) + 16; // space between rules

}

}