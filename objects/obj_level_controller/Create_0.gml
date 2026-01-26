// controls level creation

// Bench positions for planets not in orbit. max 16 planets
bench_positions = [
    {x:128, y:128}, {x:288, y:128},
    {x:128, y:256}, {x:288, y:256},
    {x:128, y:384}, {x:288, y:384},
    {x:128, y:512}, {x:288, y:512},
    {x:128, y:640}, {x:288, y:640},
	{x:128, y:768}, {x:288, y:768},
	{x:128, y:896}, {x:288, y:896},
	{x:128, y:1024}, {x:288, y:1024}
];

//call buildLevel given current level to sett all variables
buildLevel(global.CURRENT_LEVEL);

// VALIDATION VARIABLES
level_complete = 0; // true when all planets are on the system and rules all pass