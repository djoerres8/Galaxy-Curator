
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
				
		var num_planets_activley_in_orbit = 0;
		
		//loop through the planets in orbit and check their sizes to increment num in orbit
		for (var j = 0; j < array_length(obj_level_controller.orbits[i].planets); j++){
			switch (obj_level_controller.orbits[i].planets[j].size){
				case "large":  num_planets_activley_in_orbit += 2;  break;
				case "medium": num_planets_activley_in_orbit += 1;  break;
				case "small":  num_planets_activley_in_orbit += .5; break;
				default: num_planets_activley_in_orbit += 1; break;	
			}
		}
		
		// make sure the number of planets in the orbit is <= limit
		if (num_planets_activley_in_orbit > limit){
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
	
	if (msg){
		if (limit == 1){
			return "Every Orbit must have exactly " + string(limit) + " Planet.";
		}else{
			return "Every Orbit must have exactly " + string(limit) + " Planets.";
		}
		
	}
	
	//loop through every orbit
	for (var i = 0; i < array_length(obj_level_controller.orbits); i++){	
		
		var num_planets_activley_in_orbit = 0;
		
		//loop through the planets in orbit and check their sizes to increment num in orbit
		for (var j = 0; j < array_length(obj_level_controller.orbits[i].planets); j++){
			switch (obj_level_controller.orbits[i].planets[j].size){
				case "large":  num_planets_activley_in_orbit += 2;  break;
				case "medium": num_planets_activley_in_orbit += 1;  break;
				case "small":  num_planets_activley_in_orbit += .5; break;
				default: num_planets_activley_in_orbit += 1; break;	
			}
		}
		
		// make sure the number of planets in the orbit is <= limit
		if (num_planets_activley_in_orbit != limit){
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