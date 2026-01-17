//All planets will have these variables

is_held = 0; // is the user currently holding onto the planet
stationary = 1; // if the planet is moving or not. (when you release a planet and its not on an orbit, it will move back to the bench.)
in_orbit = 0; // planet is in orbit
on_bench = 1; // planet in on bench

//variables to control bob animation while on bench
bob_speed = random_range(450, 550);
bob_distance = random_range(.18, .22);