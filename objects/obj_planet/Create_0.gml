
// PLANET TYPE VARIABLES
temperature = "any";
size = "medium";
shape = "circle";


//STATE VARIABLS
// held by player
is_held = 0; // is the user currently holding onto the planet

// traveling to orbit/bench
is_traveling = 0; // to prevent teleporting to locations when releasing the mouse, we will have traveling frames
travel_speed = 5;
travel_destination = { x: 0, y: 0 };
destination = "bench"; // can be bench or orbit. alweays starts as bench just cause.

// on bench
on_bench = 1; // planet in on bench
bench_position = 0; // which seat of the bench is th eplanet on?

// variables to control planet when in orbit
in_orbit = 0; // planet is in orbit
orbit_angle = point_direction(obj_sun.x, obj_sun.y, x, y); // the angle from the planet to the sun
orbit_speed = 0.5; // degrees per step
orbit_radius = 0; // marks which orbit the planet is on
radius = 0; // reset when applying visual update


// VALIDATION
is_passing = 0;
orbit_index = 0; // which orbit in the level is being orbited


//VISUAL FLARE 
//variables to control bob animation while on bench
bob_speed = random_range(450, 550);
bob_distance = random_range(.18, .22);

//Ripple effect
ripple_timer = 0;
ripple_duration = 120; //random_range(60, 150);
ripple_starting_alpha = .33;
alarm[0] = 60*4 //random_range(4, 7);

//PLANET VISUAL
function applyVisuals() {

    // Shape → sprite
    switch (shape) {
        case "circle": sprite_index = spr_planet_circle; break;
        case "spiky":  sprite_index = spr_planet_spiky;  break;
        case "heart":  sprite_index = spr_planet_heart;  break;
    }

    // Temperature → color tint
    switch (temperature) {
        case "hot":        image_blend = c_red;    break;
        case "cold":       image_blend = c_blue;   break;
        case "temperate":  image_blend = c_green;  break;
        case "any":        image_blend = c_gray; break;
    }
	
	// Size → scale
    switch (size) {
        case "small":  image_xscale = 0.7; image_yscale = 0.7; break;
        case "medium": image_xscale = 1.0; image_yscale = 1.0; break;
        case "large":  image_xscale = 1.4; image_yscale = 1.4; break;
    }
	
	radius = sprite_width / 2; // return radius of planet to use in calculating what orbit to snap to.
}