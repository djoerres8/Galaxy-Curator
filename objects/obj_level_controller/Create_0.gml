// controls level creation

//Use transitionFade to change to next levels
//set current level, global.current_level set in transitionFade script as parameter (so depends on New game, continue, or level select
current_level = global.CURRENT_LEVEL;

// Bench positions for planets not in orbit
bench_positions = [
    {x:128, y:128}, {x:288, y:128},
    {x:128, y:256}, {x:288, y:256},
    {x:128, y:384}, {x:288, y:384},
    {x:128, y:512}, {x:288, y:512},
    {x:128, y:640}, {x:288, y:640}
];

// get current level data
level_data = global.LEVELS[current_level];

//create planets for level
createPlanets(level_data.planets)

//tracks number of planets on the level to know where to place them on the bench
num_planets = 0;
num_orbits = level_data.orbits;

// VALIDATION VARIABLES
level_complete = 0; // true when all planets are on the system and rules all pass


orbits = createOrbits(num_orbits);

