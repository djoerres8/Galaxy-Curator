
//Limit Number of planets per orbit
function limitPlanetsPerOrbit(limit, msg){
	
	var orbits = obj_level_controller.orbits;
	
	if (msg){
		
		//set limit value on the orbits themselves
		for (var i = 0; i < array_length(orbits); i++) {
		    orbits[i].limit = limit;
		}
		
		if (limit == 1){
			return "Every Orbit may have no more than " + string(limit) + " Planet in them.";
		}else{
			return "Every Orbit may have no more than " + string(limit) + " Planets in them.";
		}
		
	}
	
	//loop through every orbit
	for (var i = 0; i < array_length(orbits); i++){	

		// make sure the number of planets in the orbit is <= limit
		if (orbits[i].num_planets > limit){
			return 0;
		}
	}
	
	//also check to make sure all planets are in orbit
	with (obj_planet) {
		if (on_bench){
			return 0;
		}
	}
	
	return 1;
}

//Limit Number of planets per orbit
function forcePlanetsPerOrbit(limit, msg){
	
	var orbits = obj_level_controller.orbits;
	
	
	if (msg){
		
		//set limit value on the orbits themselves
		for (var i = 0; i < array_length(orbits); i++) {
		    orbits[i].limit = limit;
		}
		
		if (limit == 1){
			return "Every Orbit must have exactly " + string(limit) + " Planet.";
		}else{
			return "Every Orbit must have exactly " + string(limit) + " Planets.";
		}
		
	}
	
	//loop through every orbit
	for (var i = 0; i < array_length(orbits); i++){	
		
		// make sure the number of planets in the orbit is <= limit
		if (orbits[i].num_planets != limit){
			return 0;
		}
	}
	
	//also check to make sure all planets are in orbit
	with (obj_planet) {
		if (on_bench){
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