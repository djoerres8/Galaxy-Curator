//given the current level, do everything to build the level.

function buildLevel(current_level){
	
	//for conveiniance
	var levels = global.LEVELS;

	//create planets for level
	createPlanets(levels[current_level].planets)
	
	//create the orbits for level
	obj_level_controller.orbits = createOrbits(levels[current_level].number_of_orbits);
	
	
	//set variables to obj_level_controller for the level
	//set current level, global.current_level set in transitionFade script as parameter (so depends on New game, continue, or level select
	obj_level_controller.current_level = current_level; //Use transitionFade to change to next levels
	obj_level_controller.level_data = levels[current_level];
	obj_level_controller.num_orbits = level_data.number_of_orbits; // useful, used in level validation for easier reference
	

}