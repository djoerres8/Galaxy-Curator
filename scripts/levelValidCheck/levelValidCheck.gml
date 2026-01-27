//function levelValidCheck(){
	
//	global.LEVELS[2] = {
//    number_of_orbits: 3,
//    planets: [
//        { temperature: "any", shape: "circle", size: "medium" , count: 3 },
//    ],
//	rules: [
//		function (msg) { return forcePlanetsPerOrbit(1, msg); },
//		//function (msg) { return noPlanetsOnBench(msg); }
//	],
//	tutorial : "Each level will have objectives to complete before you can finish the level."
//};

//Account for: Number orbits (1/4 red, 2/5 green, 3/6 blue)
//Account for: Limit planets per orbit, force planets per orbit
//Planet attributes
	
	//var level_rules = global.LEVELS[global.CURRENT_LEVEL].rules;
	//var orbits = global.LEVELS[global.CURRENT_LEVEL].number_of_orbits;
	
	//for (var i = 0; i < array_length(level_rules); i++){
	//	if (!level_rules[i](false)){
	//		valid = 0;	
	//	}
	//}
	
//	global.LEVELS[69] = {
//		number_of_orbits: 3,
//		planets: [
//			{ temperature: "any", shape: "circle", size: "medium" , count: 3 },
//    ],
//	rules: [],
//	tutorial : ""
//	};
	
//	number_orbits = 1;
//	limit_per_orbit = 0;
//	force_per_orbit = 0;
//	hot_count = 0;
//	cold_count = 0;
//	temperate_count = 0;
//	any_count = 0;
//	increment = 1;
//	hot_limit = 0;
//	temperate_limit = 0;
//	cold_limit = 0;
	
//	var planets = global.LEVELS[global.CURRENT_LEVEL].planets
	
//	for (var i = 0; i < number_orbits; i++){
//		hot_limit = 
//	for (var i = 0; i < array_length(planets); i++){
//		if planets[i].shape != "spiky"{
//			if (planets[i].size == "large"){
//				increment = 2;
//			}else if (planets[i].size == "small"){
//				increment = 0.5;
//			}
		
//			if (planets[i].temperature == "hot"){
//				hot_count = hot_count + increment;
//			}else if (planets[i].temperature == "cold"){
//				cold_count = cold_count + increment;
//			}else if (planets[i].temperature == "temperate"){
//				temperate_count = temperate_count + increment;
//			}else{
//				any_count = any_count + increment;
//			}
//		}else{
//	}

//}
