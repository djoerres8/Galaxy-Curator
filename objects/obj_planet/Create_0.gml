
// PLANET TYPE VARIABLES
temperature = "any";
size = "medium";
shape = "circle";

// save original shape in case of moon modification 
og_shape = "circle";
og_temperature = "any";
og_size = "medium";

//MOONS
moons = [];


//STATE VARIABLS
// held by player
is_held = 0; // is the user currently holding onto the planet

// traveling to orbit/bench
is_traveling = 0; // to prevent teleporting to locations when releasing the mouse, we will have traveling frames
travel_speed = 10;
travel_destination = { x: 0, y: 0 };
destination = "bench"; // can be bench or orbit. alweays starts as bench just cause.

// on bench
on_bench = 1; // planet in on bench
bench_x = 0;
bench_y = 0;

// variables to control planet when in orbit
in_orbit = 0; // planet is in orbit
orbit_index = -1; // which orbit in the level is being orbited. -1 if not in orbit
orbit_angle = point_direction(obj_sun.x, obj_sun.y, x, y); // the angle from the planet to the sun
orbit_speed = 0.25; // degrees per step
orbit_radius = 0; // marks which orbit the planet is on
radius = 0; // reset when applying visual update


// VALIDATION
is_passing = 0;
failing_msg = ""; // store the reason the planet is failing
orbit_index = 0; // which orbit in the level is being orbited


//VISUAL FLARE 

//BOB Effect
bob_speed = random_range(450, 550);
bob_distance = random_range(.18, .22);

//Ripple effect
ripple_timer = 0;
ripple_duration = 60; //random_range(60, 150);
ripple_starting_alpha = .5;
ripple_interval =  60*2.5;
alarm[0] = ripple_interval; //random_range(4, 7);

//Planet Glow
glow_num = 5;
glow_scale = [1.05, 1.1, 1.15, 1.2, 1.25];
glow_alpha = [.25, .2, .15, .1, .05];
planet_color = c_gray;

//PLANET VISUAL
function applyVisuals() {

    // Shape → sprite
    switch (shape) {
        case "circle": sprite_index = spr_planet_circle; break;
        case "spiky":  sprite_index = spr_planet_spiky;  break;
        case "heart":  sprite_index = spr_planet_heart;  break;
		default: sprite_index = spr_planet_circle;
    }

    // Temperature → color tint
    switch (temperature) {
        case "hot":        planet_color = c_red;    break;
        case "cold":       planet_color = c_blue;   break;
        case "temperate":  planet_color = c_green;  break;
        case "any":        planet_color = c_gray;   break;
		default:  planet_color = c_gray;
    }
	image_blend = planet_color;
	
	// Size → scale
    switch (size) {
        case "small":  image_xscale = 0.5; image_yscale = 0.5; break;
        case "medium": image_xscale = 1.0; image_yscale = 1.0; break;
        case "large":  image_xscale = 1.8; image_yscale = 1.8; break;
		default:  image_xscale = 1.0; image_yscale = 1.0;
    }
	
	radius = sprite_width / 2; // return radius of planet to use in calculating what orbit to snap to.
}

//create a callable function that will apply moon modifiers
function addMoon(moon){
	
	// add moon to planet's moons
	array_push(moons, moon.id);
	
	switch(moon.modifier){
		case "spiky":   shape = "spiky";  break;
		case "heart": shape = "heart"; break;
		case "circle": shape = "circle"; break;
		case "hotter":
			switch(temperature){
				case "cold": temperature = "temperate" break;
				case "temperate": temperature = "hot" break;
				case "any": temperature = "hot";
			} 
			break;
		case "colder":  
			switch(temperature){
				case "hot": temperature = "temperate" break;
				case "temperate": temperature = "cold" break;
				case "any": temperature = "cold";
			} 
			break;
		case "smaller": 
			switch(size){
				case "medium": size = "small" break;
				case "large": size = "medium" break;
			} 
			break;
		case "larger":  
			switch(size){
				case "small": size = "medium" break;
				case "medium": size = "large" break;
			} 
			break;
	}
	
}

function removeMoon(moon){
	
	//remove moon from planet's moons
	array_delete(moons, array_get_index(moons, moon.id), 1);
	
	switch(moon.modifier){
		case "spiky": shape = og_shape;  break;
		case "heart": shape = og_shape; break;
		case "circle": shape = og_shape; break;
		case "hotter":
			if (og_temperature == "any"){
				temperature = "any";
			}else{
				switch(temperature){
					case "hot": temperature = "temperate" break;
					case "temperate": temperature = "cold" break;
				}
			}
			break;
		case "colder":  
			if (og_temperature == "any"){
				temperature = "any";
			}else{
				switch(temperature){
					case "cold": temperature = "temperate" break;
					case "temperate": temperature = "hot" break;
				}
			}
			break;
		case "smaller": 
			switch(size){
				case "small": size = "medium" break;
				case "medium": size = "large" break;
			} 
			break;
		case "larger":  
			switch(size){
				case "medium": size = "small" break;
				case "large": size = "medium" break;
			} 
			break;
	}
}

function checkMoonCompatable(moon){
	
	if (moon.modifier == shape){ show_debug_message("1") return 0;} // cant place the same shape modifier on a planet
	else if ((moon.modifier == "circle" || moon.modifier == "spiky" || moon.modifier == "heart") && shape != og_shape){ show_debug_message("2") return 0;} // multiple shape modifier moons cannot be on the same planet
	else if (moon.modifier == "hotter" && temperature == "hot"){ show_debug_message("3") return 0;} // cant make a hot planet hotter
	else if (moon.modifier == "colder" && temperature == "cold"){ show_debug_message("4") return 0;} // cant make a cold planet colder
	else if ((moon.modifier == "colder" || moon.modifier == "hotter") && og_temperature != temperature && (og_temperature == "any" || og_temperature == "temperate")){ show_debug_message("5") return 0;} // cant adjust an "any" or "temperate" temp planet more than once
	else if (moon.modifier == "colder" && og_temperature == "cold"){ show_debug_message("6") return 0;} // cant add a cold moon to a cold planet
	else if (moon.modifier == "hotter" && og_temperature == "hot"){ show_debug_message("7") return 0;} // cant add a cold moon to a cold planet
	else if (moon.modifier == "smaller" && size == "small"){ show_debug_message("8") return 0;} // cant make a small planet smaller
	else if (moon.modifier == "larger" && size == "large"){ show_debug_message("9") return 0;} // cant make a large planet larger
	else if ((moon.modifier == "larger" || moon.modifier == "smaller") && og_size != size && og_size == "medium"){ show_debug_message("10") return 0;} // medium planets can only have 1 size modifier
	else if (moon.modifier == "larger" && og_size == "large"){ show_debug_message("11") return 0;} // cant increase size of planets that started large
	else if (moon.modifier == "smaller" && og_size == "small"){ show_debug_message("12") return 0;} // cant decrease size of planets that started small
	
	else return 1;
}