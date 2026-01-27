//given the current level, do everything to build the level.
function buildLevel(current_level){
	
	//for conveiniance
	var levels = global.LEVELS;

	//create moons for level
	if (levels[current_level].moons != undefined){
		createMoons(levels[current_level].moons);
	}
	
	//create planets for level
	createPlanets(levels[current_level].planets);
	
	//create the orbits for level
	obj_level_controller.orbits = createOrbits(levels[current_level].number_of_orbits);
	

}

