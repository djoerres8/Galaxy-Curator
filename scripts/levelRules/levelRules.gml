
//Limit Number of planets per orbit
function limitPlanetsPerOrbit(limit, msg){
	
	if (msg){
		if (limit == 1){
			return "Every Orbit may have no more than " + string(limit) + " Planet in them.";
		}else{
			return "Every Orbit may have no more than " + string(limit) + " Planets in them.";
		}
		
	}
	
	//loop through every orbit
	for (var i = 0; i < array_length(obj_level_controller.orbits); i++){	
		
		// make sure the number of planets in the orbit is <= limit
		if (array_length(obj_level_controller.orbits[i].planets) > limit){
			return 0;
		}
	}
	
	return 1;
}

//Limit Number of planets per orbit
function forcePlanetsPerOrbit(limit, msg){
	
	if (msg){
		if (limit == 1){
			return "Every Orbit must have exactly " + string(limit) + " Planet.";
		}else{
			return "Every Orbit must have exactly " + string(limit) + " Planets.";
		}
		
	}
	
	//loop through every orbit
	for (var i = 0; i < array_length(obj_level_controller.orbits); i++){	
		
		// make sure the number of planets in the orbit is == limit
		if (array_length(obj_level_controller.orbits[i].planets)  !=  limit){
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