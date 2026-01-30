
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

//no planets can be on bench
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
	
function limitMoonsPerPlanet(limit, msg){
	
	if (msg){		
		if (limit == 1){
			return "Every Planet can only have " + string(limit) + " moon.";
		}else{
			return "Every Planet can only have " + string(limit) + " moons.";
		}
	}
	
	//loop through every planet
	with(obj_planet){
		// make sure the number of moons on the planet is <= limit
		if (array_length(moons) > limit){
			return 0;
		}
	}
	
	return 1;
}

function forceMoonsPerPlanet(limit, msg){
	
	if (msg){		
		if (limit == 1){
			return "Every Planet must have exactly " + string(limit) + " moon.";
		}else{
			return "Every Planet must have exactly " + string(limit) + " moons.";
		}
	}
	
	//loop through every planet
	with(obj_planet){
		// make sure the number of moons on the planet is != limit
		if (array_length(moons) != limit){
			return 0;
		}
	}
	
	return 1;
}

function LimitUsableMoons(limit, msg){
	
	if (msg){		
		if (limit == 1){
			return "You may only use " + string(limit) + " moon.";
		}else{
			return "You may only use " + string(limit) + " moons.";
		}
	}
	
	var number_of_moons_in_use = 0;
	
	//loop through every planet
	with(obj_planet){
		// count how many moons are orbiting planets
		number_of_moons_in_use += array_length(moons);
	}
	
	if (number_of_moons_in_use >= limit){
		return 0;
	}
	
	return 1;
	
}

// ban planets from specified orbits. array indexed
function banOrbit(orbit_index, msg){
	
	if (msg){		
		switch (orbit_index){
			case 0: return "No planets can be in the orbit closest to the sun.";
			case 1: return "No planets can be in the 2nd Orbit.";
			case 2: return "No planets can be in the 3rd Orbit.";
			case 3: return "No planets can be in the 4th Orbit.";
			case 4: return "No planets can be in the 5th Orbit.";
			case 5: return "No planets can be in the outermost Orbit.";
		}
	}
	
	// make sure specified orbit has 0 planets
	if (obj_level_controller.orbits[orbit_index].num_planets != 0){
		return 0;
	}
	
	return 1;
	
}