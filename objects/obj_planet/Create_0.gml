//All planets will have these variables

is_held = 0; // is the user currently holding onto the planet


is_traveling = 0; // to prevent teleporting to locations when releasing the mouse, we will have traveling frames
travel_speed = 5;
travel_destination = { x: 0, y: 0 };
destination = "bench"; // can be bench or orbit. alweays starts as bench just cause.

on_bench = 1; // planet in on bench
bench_position = 0; // which seat of the bench is th eplanet on?
radius = sprite_get_width(sprite_index) / 2; // return radius of planet to use in calculating what orbit to snap to.

//variables to control bob animation while on bench
bob_speed = random_range(450, 550);
bob_distance = random_range(.18, .22);

// variables to control planet when in orbit
in_orbit = 0; // planet is in orbit
orbit_angle = point_direction(obj_sun.x, obj_sun.y, x, y); // the angle from the planet to the sun
orbit_speed = 0.5; // degrees per step
orbit_radius = 0; // marks which orbit the planet is on