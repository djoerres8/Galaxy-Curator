
//Limit Number of planets per orbit
function limitPlanetsPerOrbit(limit, msg){
	
	if (msg){
		return "Every Orbit may have no more than " + string(limit) + " Planets in them.";
	}
	
	//loop through every orbit
	for (var i = 0; i < obj_level_controller.num_orbits; i++){	
		
		// make sure the number of planets in the orbit is <= limit
		if (array_length(obj_level_controller.orbits[i].planets) > limit){
			return 0;
		}
	}
	
	return 1;
}


function noPlanetsOnBench(msg){
	
	if (msg){
		return "All Planets must be in an orbit.";
	}
	
	with (obj_planet) {
		if (on_bench){
			return 0;
		}
	}
	
	return 1;
}