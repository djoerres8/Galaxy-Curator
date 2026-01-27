
// MOON MODIFIER
modifier = "";


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

// variables to control planet when on planet
on_planet = 0; // planet is in orbit
planet_id = -1; // which planet instance in the level is being orbited. -1 if not in orbit
orbit_angle = point_direction(planet_id.x, planet_id.y, x, y); // the angle from the planet to the sun
orbit_speed = 0.25; // degrees per step
orbit_radius = 0;
orbit_distance = 10; // how many pixels away should the moon orbit the planet
radius = 0; // reset when applying visual update


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


//PLANET VISUAL
function applyMoonVisuals() {
	 
    // Shape → sprite
    switch (modifier) {
        case "round":   sprite_index = spr_moon; break;
        case "spiky":   sprite_index = spr_moon_spiky;  break;
        case "heart":   sprite_index = spr_moon_heart;  break;
        case "hotter":  image_blend = c_red;    break;
        case "colder":  image_blend = c_blue;   break;
        case "smaller":  break;
        case "larger":   break;
    }
	
	radius = sprite_width / 2; // return radius of planet to use in calculating what orbit to snap to.
}